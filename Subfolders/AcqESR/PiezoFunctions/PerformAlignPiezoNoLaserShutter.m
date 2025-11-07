%% PerformAlignPiezoNoLaserShutter
%% Script d'alignement par piezo et autocorrélation
% Idée :
% Prendre des images en scan sur X, sur Y et sur Z
% Autocorréler et sélectionner les coordonnées de celle qui est le plus corrélé
% Attention : c'est l'échantillon qui se décale, et on joue sur le laser pour rattraper
% Il faut donc aussi décaler l'image d'autant pour garder toujours le laser au même endroit sur l'image
% Séparer Z c'est mieux ; utiliser de l'autofocus plutôt que de l'autocorrélation sur Z c'est  mieux

% In short: autofocus Z, then sweep of a small area with the laser while following with the camera
% The point where the image is most similar to the initial reference image is then selected

% NoLaserShutter: way worse method that kinda works when you have no laser shutter

%% Initialization

plotMaxLum = 11000; % used for tests only

if panel.stop.Value~=1

    disp('Starting Full Piezo Alignment Procedure');

    IniX = AcqParameters.PiezoX;
    IniY = AcqParameters.PiezoY;

    LightOn(panel); % turning light on for all piezo alignment procedures

    if strcmp(CameraType,'Andor')
        [I,ISize,AOI] = PrepareCamera(); % need to prepare AFTER LightOn or LightOff, I don't know why
    end

    CalibPiezoX = AcqParameters.CalibPiezoX; % µm per 10V % set in the Camera Panel
    CalibPiezoY = AcqParameters.CalibPiezoY; % µm per 10V % set in the Camera Panel
    CalibPixelCam =  AcqParameters.PixelCalib_nm/1000; % µm per pixel % set in the Camera Panel

    PiezoRangeX = AcqParameters.PiezoRangeX;
    PiezoRangeY = AcqParameters.PiezoRangeY;
    PiezoStepX = AcqParameters.PiezoStepX;
    PiezoStepY = AcqParameters.PiezoStepY;

    StepX = PiezoRangeX/(PiezoStepX-1);
    StepY = PiezoRangeY/(PiezoStepY-1);

    LeftX = max([-10,IniX - PiezoRangeX/2]);
    LeftY = max([-10,IniY - PiezoRangeY/2]);
    RightX = min([IniX+PiezoRangeX/2,10]);
    RightY = min([IniY+PiezoRangeY/2,10]);

    %% Autofocus z
    [Opt_Z, z_out, foc_out, Shift_Z, fit_z_successful] = FuncIndepAutofocusPiezo(panel);

    %% Autocorrélation xy

    PrevX = IniX;
    PrevY = IniY;
    ind_prog = 0;
    AOI_init = AOI;
    for i=1:PiezoStepX
        for j=1:PiezoStepY
            ind_prog = ind_prog + 1;
            if rem(ind_prog,10) == 0
                disp(['Autocorrelation xy in progress ' num2str(ind_prog) '/' num2str(PiezoStepX*PiezoStepY)]);
            end
            NewX = min([10,LeftX + (i-1)*StepX]); X_piez(i) = NewX;
            NewY = min([10,LeftY + (j-1)*StepY]); Y_piez(j) = NewY;
            DeltaX_pix(i,j) = -round((CalibPiezoX*(NewX-PrevX)/10)/CalibPixelCam); % moves the AOI to follow the laser movement
            DeltaY_pix(i,j) = -round((CalibPiezoY*(NewY-PrevY)/10)/CalibPixelCam);

            if DeltaX_pix(i,j) ~= 0 || DeltaY_pix(i,j) ~= 0
                if strcmp(CameraType,'Andor')
                    EndAcqCamera();
                end

                SendAOItoCAM(AOI.X+DeltaX_pix(i,j),AOI.Y+DeltaY_pix(i,j),AOI.Width,AOI.Height);

                if strcmp(CameraType,'Andor')
                    [I,ISize,AOI] = PrepareCamera();
                end
            end
            CheckMaxAndWriteNI(NewX, NewY, Opt_Z, AcqParameters.PiezoLight, false);

            ImageCurrent = TakeCameraImage(ISize,AOI);
            % figure;imagesc(ImageCurrent);

            [crop1_out,crop2_out] = Align2Files(Lum_Initial,ImageCurrent,0); % align the two laser spots by autocorr
            Pic1crop = Lum_Initial(crop1_out(1):crop1_out(2),crop1_out(3):crop1_out(4)); % result: crop both images to center laser spot
            Pic2crop = ImageCurrent(crop2_out(1):crop2_out(2),crop2_out(3):crop2_out(4));
            Corr_simple(i,j) = sum(sum(xcorr2_fast_manual(Pic1crop,Pic2crop))); % simple correlation value between the images
            Number_pixels(i,j) = numel(Pic1crop);

            PrevX = NewX; PrevY = NewY;
        end
    end

    Corr_renorm = Corr_simple./Number_pixels; % better to renormalize by the number of pixels in the cropped images

    [minVal, minPos] = min(Corr_simple(:));
    [indx,indy] = ind2sub(size(Corr_simple), minPos);

    SendAOItoCAM(AOI_init.X+DeltaX_pix(indx,indy),AOI_init.Y+DeltaY_pix(indx,indy),AOI_init.Width,AOI_init.Height);
    ImageCurrent = TakeCameraImage(ISize,AOI);
    C = normxcorr2_general(Lum_Initial,ImageCurrent,numel(Lum_Initial)/2);
    [ypeak, xpeak] = find(C==max(C(:)));
    Yshift = ypeak-AOI_init.Height;
    Xshift = xpeak-AOI_init.Width;
    disp(['X shift = ' num2str(Xshift)])
    disp(['Y shift = ' num2str(Yshift)])
    EndAcqCamera();
    SetAOI(AOI_init.X+Xshift,AOI_init.Y+Yshift,AOI_init.Width,AOI_init.Height);
    [I,ISize,AOI] = PrepareCamera();


    Opt_X = LeftX + (indx-1)*StepX;
    Opt_Y = LeftY + (indy-1)*StepY;

    Shift_X = Opt_X-IniX;
    Shift_Y = Opt_Y-IniY;

    %% Résulats finaux, image, et éteignage de la lampe

    UpdateInputPiezo(Opt_X,Opt_Y,Opt_Z,AcqParameters.PiezoLight);
    CheckMaxAndWriteNI(Opt_X, Opt_Y, Opt_Z, AcqParameters.PiezoLight, false);

    Lum_Post_AutoCorr = TakeCameraImage(ISize,AOI);

    ax_lum_post_autocorr = panel.ax_lum_post_autocorr;
    imagesc(ax_lum_post_autocorr,Lum_Post_AutoCorr);axis(ax_lum_post_autocorr,'image');caxis(ax_lum_post_autocorr,[0 MaxLum]);
    set(ax_lum_post_autocorr,'Tag','ax_lum_post_autocorr'); % Necessary to rewrite tag of axes after imagesc (I don't know why)
    title(ax_lum_post_autocorr, 'New image post autocorrelation');

    CheckMaxAndWriteNI(Opt_X, Opt_Y, Opt_Z, 0, false);

    fit_xy_successful = [];ssimValue_trans = [];

end

if panel.stop.Value==1
    Lum_Post_AutoCorr = Lum_Initial; X_piez = []; Y_piez = []; ssimValue_trans = []; Shift_X = []; Shift_Y = []; fit_xy_successful = [];
end

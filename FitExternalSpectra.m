%% Fit External ODMR Spectrum coming from a .xlsx file

clearvars ;
addpath(genpath('Subfolders'));addpath(genpath(getPath('Main')));

%% Open file

Pathfile = 'C:\Users\ADM_TORAILLEL\Desktop\Working folder\';
fname = 'SiFNDODMR.xlsx';

M = readmatrix([Pathfile fname]);

v_MHz = M(:,1);
Full_spectra = num2cell(M(:,2:end),1);

%% Load parameters

load([getPath('Param') 'FitParameters.mat'],'FitParameters');
ReadFitParameters;

%% Plot one spectrum
i = 7;
saveESR = 0; %saves ESR in svg, png and data form
secondAxis = 1; %creates second axis with real luminescence on the right
withTitle = 1; %removes title for graphic reasons
FigureSize = 0.85; % choose small size for big text when saving

spectre = Full_spectra{i};
spectre = PerformTreatmentOperations(spectre, v_MHz, Smoothing_Factor, Detrending_Factor, ClearFFT, RemPositive);

ix = 1; iy = 1; x_um = [1] ; y_um = [1]; BinThr = 1; BinOut = 1;

plotESRSp(spectre, ix, iy, v_MHz, x_um, y_um, fname, BinThr, BinOut, Calib_Dist, secondAxis, withTitle, FigureSize, TreatedDataPath, saveESR); 

%% Fit one spectrum
%Set up parameters in FitParameters.mat
load([getPath('Param') 'FitParameters.mat'],'FitParameters');
ReadFitParameters;

PlotpStart = 0; 
i = 7;

spectre = Full_spectra{i};
spectre = PerformTreatmentOperations(spectre, v_MHz, Smoothing_Factor, Detrending_Factor, ClearFFT, RemPositive);

ix = 1; iy = 1; x_um = [1] ; y_um = [1]; BinThr = 1; BinOut = 1;

clear pStart % don't hesitate to comment this line
if ~exist('pStart','var')
    pStart = LoadPStart([getPath('Param') 'PstartFit'],NumComp, VarWidths, IsPair);
end % use the saved pStart in case of loading

isPlot = true;
pStart = lastUpdatePstart(spectre, pStart);
jx = fitOneEsr(v_MHz, spectre, pStart, isPlot, FitParameters);
if isPlot
    Ffit = DefJacFw(v_MHz, VarWidths, NumComp, IsPair); % necessary for the plot
    PlotFitParam(v_MHz, spectre, ix, iy, x_um, y_um, fname, Ffit(pStart), Ffit(jx), BinThr, BinOut, Calib_Dist, FitMethod, PlotpStart);
end

CheckJx(ix, iy, jx, NumComp, IsPair);

B = fittofield(jx, NumComp, NumCompFittofield, FitMethod)





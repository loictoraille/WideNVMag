function FuncAutoMaxLumLive(hobject)
global handleImage

if exist('handleImage','var') && ~isempty(handleImage)

    LumToPlot = handleImage.CData;

    if exist('LumToPlot','var')

        MaxLumVal = round(max(max(LumToPlot)));
        MaxLum = max(1,round(1.05*MaxLumVal));
        hobject.MaxLum.String = num2str(MaxLum);
        hobject.MaxLumLive.String = num2str(MaxLum);

        set(get(handleImage, 'Parent'), 'CLim', [0 MaxLum]);

    end

end

end
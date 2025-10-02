function UpdateAlignPiezo(hobject,~)
global NI_card

AutoAlignPiezo = hobject.Value;

PiezoControl = 0;

if AutoAlignPiezo
    % Check if piezo are connected
        if exist('NI_card','var') && any(isprop(NI_card,'Running')) && ~isempty(daqlist)
            PiezoControl = 1;
        end
end

if PiezoControl == 0
    hobject.Value = 0;
end

UpdateAcqParam();


end
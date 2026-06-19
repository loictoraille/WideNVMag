function UpdateOpenESRParam(hobject,~)

if exist("hobject",'var') && isfield(hobject,'Save')
    panel = hobject;
else
    panel=guidata(gcbo);
end

if isfield(panel,'DisplayLightOpenESR')
    DisplayLightOpenESR = panel.DisplayLightOpenESR.Value;
else
    DisplayLightOpenESR = panel.DisplayLight.Value;
end

MaxLumAlwaysAuto = panel.MaxLumAlwaysAuto.Value;
MaxLum = str2double(panel.MaxLum.String);

SaveOpenESRParameters({{DisplayLightOpenESR,'DisplayLightOpenESR'},...
    {MaxLumAlwaysAuto,'MaxLumAlwaysAuto'},{MaxLum,'MaxLum'}});



















end
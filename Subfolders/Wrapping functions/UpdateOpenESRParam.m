function UpdateOpenESRParam(~,~)

tag_DisplayLightOpenESR = findobj('Tag','DisplayLightOpenESR');
tag_DisplayLight = findobj('Tag','DisplayLight');
tag_MaxLumAlwaysAuto = findobj('Tag','MaxLumAlwaysAuto');
tag_MaxLum = findobj('Tag','MaxLum');

if isempty(tag_DisplayLightOpenESR)
    DisplayLightOpenESR = tag_DisplayLight.Value;
else
    DisplayLightOpenESR = tag_DisplayLightOpenESR.Value;
end

MaxLumAlwaysAuto = tag_MaxLumAlwaysAuto.Value;
MaxLum = str2double(tag_MaxLum.String);

SaveOpenESRParameters({{DisplayLightOpenESR,'DisplayLightOpenESR'},...
    {MaxLumAlwaysAuto,'MaxLumAlwaysAuto'},{MaxLum,'MaxLum'}});

end
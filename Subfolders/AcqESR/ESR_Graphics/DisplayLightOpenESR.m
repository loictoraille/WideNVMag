function DisplayLightOpenESR(~,~)

panel = guidata(gcbo);

DisplayLight = panel.DisplayLightOpenESR.Value;

AOIParameters = panel.UserData.AOIParameters;
MaxLum = str2double(panel.MaxLum.String);
MaxLumAlwaysAuto = panel.MaxLumAlwaysAuto.Value;

if DisplayLight && isfield(panel,'UserData') && isfield(panel.UserData,'Lum_WithLightAndLaser') && ~isempty(panel.UserData.Lum_WithLightAndLaser) 
    MaxLum = PrintImage(panel.Axes1,panel.UserData.Lum_WithLightAndLaser,AOIParameters,MaxLum,MaxLumAlwaysAuto);
else
    panel.DisplayLightOpenESR.Value = 0;
    MaxLum = PrintImage(panel.Axes1,panel.UserData.Lum_Current,AOIParameters,MaxLum,MaxLumAlwaysAuto);
end

panel.MaxLum.String = num2str(MaxLum);

PrintESR(panel,panel.UserData.M);

UpdateOpenESRParam();

end
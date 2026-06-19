function UpdateMaxLumAlwaysAuto(~,~)

panel = guidata(gcbo);

MaxLumAlwaysAuto = panel.MaxLumAlwaysAuto.Value;

panel.MaxLumLiveAlwaysAuto.Value = MaxLumAlwaysAuto;

UpdateAcqParam();

end
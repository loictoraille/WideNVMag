function UpdateMaxLumLiveAlwaysAuto(~,~)

panel = guidata(gcbo);

MaxLumAlwaysAuto = panel.MaxLumLiveAlwaysAuto.Value;

panel.MaxLumAlwaysAuto.Value = MaxLumAlwaysAuto;

UpdateAcqParam();

end
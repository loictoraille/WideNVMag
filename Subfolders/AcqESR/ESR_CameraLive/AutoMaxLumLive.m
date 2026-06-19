function AutoMaxLumLive(~,~)

panel = guidata(gcbo);

%panel.MaxLumLive.Value = 1; I don't see the point of this line

FuncAutoMaxLumLive(panel);

UpdateAcqParam();

end
function UpdateMagSweep(hobject,~)

panel=guidata(gcbo);

BSweepMax = str2double(panel.BSweepMax.String);

if hobject.Value == 1
    panel.RepeatScan.String = num2str(1+BSweepMax*5);
else
    panel.RepeatScan.String = 1;
end

UpdateAcqParam();

end
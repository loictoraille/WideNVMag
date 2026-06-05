function UpdatePrefixName(~,~)

load([getPath('Param') 'AcqParameters.mat']);

panel = guidata(gcbo);

if strcmp(panel.FileNamePrefixChoice.SelectedObject.String, 'Date+Base')
    panel.FileNamePrefix.String = [date '-ESR-WideField'];
elseif strcmp(panel.FileNamePrefixChoice.SelectedObject.String, 'Date+Time')
    panel.FileNamePrefix.String = GenDateTimeName(str2double(panel.RepeatScan.String));
else
    panel.FileNamePrefix.String = panel.FileNameUserPrefix.String;
end

FileNamePrefixChoice = panel.FileNamePrefixChoice.SelectedObject.String;
SaveAcqParameters({{FileNamePrefixChoice,'FileNamePrefixChoice'}}); % necessary because NameGen calls for it

BuildName = NameGen(AcqParameters.Data_Path,panel.FileNamePrefix.String);
SaveAcqParameters({{BuildName,'BuildName'}});
UpdateAcqParam;

end
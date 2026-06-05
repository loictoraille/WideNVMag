function NextFileFunction(~,~)
global Ftot M AcqParameters CameraType

panel = guidata(gcbo);

load([getPath('Param') 'FileInfo.mat'],'-mat','Data_Path')

folderPath = Data_Path;
fileName = panel.fname.String;

newFileName = GenNextFileName(fileName,panel.FileNamePrefixChoice.SelectedObject.String,str2double(panel.RepeatScan.String));

% Check if the new file exists in the folder
exists = isfile(fullfile(folderPath, newFileName));

if newFileName ~= fileName && exists
    pname = Data_Path;
    fname = newFileName;
    OpenFileCommonScript;
end

end
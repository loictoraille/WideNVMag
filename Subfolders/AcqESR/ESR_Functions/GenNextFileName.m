function newFileName = GenNextFileName(fileName,filePrefix,RepeatScan)

if strcmp(fileName,'backup') 
    newFileName = fileName;
elseif strcmp(filePrefix, 'Date+Time')
    newFileName = GenDateTimeName(RepeatScan);
else

% Extract the base name and the number from the file name
    [~, baseName, ~] = fileparts(fileName);
    numStr = regexp(baseName, '\d+$', 'match');
    baseName = strrep(baseName,' ','');
    
    if isempty(numStr)
        disp('The file name does not end with a number.');
    end
    
    % Convert the number string to a number
    num = str2double(numStr{1});
    
    % Generate the new file name with the incremented number
    newNum = sprintf('%03d', num + 1);
    newFileName = [baseName(1:end-length(numStr{1})), num2str(newNum)];

end

end
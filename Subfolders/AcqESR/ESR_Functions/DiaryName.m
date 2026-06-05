function name_diary = DiaryName(Data_Path, nomSave, FileNamePrefix, Scan)

if strcmp(FileNamePrefix, 'Date+Time')

name_diary = [Data_Path nomSave '-' datestr(now, 'yyyymmdd-HHMMSS') '_log.txt'];

else

name_diary = [Data_Path nomSave '-' sprintf('%03d', Scan) '_log.txt'];

end


end
function Name = GetSaveName(BuildName,Save)

if Save
    Name = BuildName;
else
    Name = 'backup';
end

end
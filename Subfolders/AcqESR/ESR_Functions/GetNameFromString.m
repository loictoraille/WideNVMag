function filename = GetNameFromString(str)

    prefix = 'File:';

    if strncmp(str, prefix, length(prefix))
        filename = strtrim(str(length(prefix)+1:end));
        filename = [filename '.mat'];
    else
        filename = [str '.mat'];
    end

end
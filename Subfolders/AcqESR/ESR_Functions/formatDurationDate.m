function str = formatDurationDate(date)

[h, m, s] = hms(date);
s = round(s);

    parts = {};
    if h > 0
        parts{end+1} = sprintf('%dh', h);
    end
    if m > 0
        parts{end+1} = sprintf('%dmin', m);
    end
    if s > 0 || isempty(parts)  % toujours afficher quelque chose, même 0s
        parts{end+1} = sprintf('%ds', s);
    end

    str = strjoin(parts, ' ');

end

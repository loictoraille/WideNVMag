
function T_string = CreateT_string(T)
% extract info string dynamically from readTemp

T_string = '';

if ~iscell(T)
    T_string = sprintf(['Ta=' num2str(roundn(mean(T(:,1),'omitnan'),-2)) '\nTb=' num2str(roundn(mean(T(:,2),'omitnan'),-2))]);
else
    fields = fieldnames(T{1});
    parts = {};

    for i = 1:numel(fields)
        fname = fields{i};
        vals = cellfun(@(x) x.(fname), T);

        if all(isnan(vals))
            continue  
        end

        m = round(mean(vals, 'omitnan'), 2);
        parts{end+1} = sprintf('%s=%.2f', fname, m);
    end

    T_string = strjoin(parts,'\n');
%     T_string = strjoin(parts, ', ');
end

end
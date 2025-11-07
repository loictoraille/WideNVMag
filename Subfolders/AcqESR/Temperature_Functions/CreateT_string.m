
function T_string = CreateT_string(T)
% extract info string dynamically from readTemp

T_string = '';

if ~isfield(T,'Ta')
    T_string = sprintf(['Ta=' num2str(roundn(mean(T(:,1),'omitnan'),-2)) '\nTb=' num2str(roundn(mean(T(:,2),'omitnan'),-2))]);
else
    fields = fieldnames(T);
    for i = 1:numel(fields)
        fname = fields{i};
        val = T.(fname);               % Accès dynamique
        m = roundn(mean(val, 'omitnan'),-2);      % Moyenne sans NaN
        T_string =  [str sprintf('%s=%.2f', fname, m)];
    end
end

end
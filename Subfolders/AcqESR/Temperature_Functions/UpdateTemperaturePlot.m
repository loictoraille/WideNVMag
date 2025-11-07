function UpdateTemperaturePlot(ax_temp)

tagA = findobj('tag','SensorA');
tagB = findobj('tag','SensorB');
tagC = findobj('tag','SensorC');
tagD = findobj('tag','SensorD');
tagA_Name = findobj('tag','SensorA_Name');
tagB_Name = findobj('tag','SensorB_Name');
tagC_Name = findobj('tag','SensorC_Name');
tagD_Name = findobj('tag','SensorD_Name');

% Récupérer les données stockées
data = ax_temp.UserData;

% Initialize legend variables
legend_entries = {}; % Stores the names of the plotted data
plot_handles = [];   % Stores the handles of the plotted curves

% Tracer les courbes
cla(ax_temp);
hold(ax_temp, 'on');
if tagA.Value == 1
    hA = plot(ax_temp, data.time, data.Ta, '-o', 'LineWidth', 2, 'Color', 'b');
    plot_handles = [plot_handles, hA];
    legend_entries{end+1} = tagA_Name.String; % Add legend text
end
if tagB.Value == 1
    hB = plot(ax_temp, data.time, data.Tb, '-o', 'LineWidth', 2, 'Color', 'r');
    plot_handles = [plot_handles, hB];
    legend_entries{end+1} = tagB_Name.String; % Add legend text
end
if tagC.Value == 1
    hC = plot(ax_temp, data.time, data.Tc, '-o', 'LineWidth', 2, 'Color', 'g');
    plot_handles = [plot_handles, hC];
    legend_entries{end+1} = tagC_Name.String; % Add legend text
end
if tagD.Value == 1
    hD = plot(ax_temp, data.time, data.Td, '-o', 'LineWidth', 2, 'Color', 'y');
    plot_handles = [plot_handles, hD];
    legend_entries{end+1} = tagD_Name.String; % Add legend text
end
hold(ax_temp, 'off');

% Update the legend only if there are plotted curves
if ~isempty(plot_handles)
    legend(ax_temp, plot_handles, legend_entries, 'Location', 'best');
else
    legend(ax_temp, 'off'); % Hide legend if no data is plotted
end

% Mise à jour des axes
datetick(ax_temp, 'x', 'HH:MM:SS');
xlabel(ax_temp, 'Time');
ylabel(ax_temp, 'Temperature (K)');
grid(ax_temp, 'on');

% Rafraîchir l'affichage
drawnow;

ax_temp.UserData = data;

end

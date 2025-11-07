function TimerReadAndPlot(ax_temp)
    % Lire la température
    T = ReadTemp();
    Ta = T.Ta; Tb = T.Tb;Tc = T.Tc;Td = T.Td;

    % Récupérer les données stockées dans l'axe
    data = ax_temp.UserData;

    % Ajouter les nouvelles données
    data.time = [data.time, now];
    data.Ta = [data.Ta, Ta];
    data.Tb = [data.Tb, Tb];
    data.Tc = [data.Tc, Tc];
    data.Td = [data.Td, Td];

    % Stocker les nouvelles données dans UserData
    ax_temp.UserData = data;

    % Mettre à jour le graphique
    UpdateTemperaturePlot(ax_temp);
end

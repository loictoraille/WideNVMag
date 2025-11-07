function T=ReadTemp()

panel = guidata(gcf);

measA = panel.SensorA.Value;
measB = panel.SensorB.Value;
measC = panel.SensorC.Value;
measD = panel.SensorD.Value;

if isfield(panel,'UserData') && isfield(panel.UserData,'Lakeshore')
    Lakeshore = panel.UserData.Lakeshore;
    flush(Lakeshore);

    if measA

    ReadTempA='KRDG?A';
    writeline(Lakeshore, ReadTempA);
    Ta = readline(Lakeshore); % dummy because first one sometimes doesn't work
    writeline(Lakeshore, ReadTempA);
    Ta = readline(Lakeshore);
    pause(0.01)

    else
        Ta = NaN;
    end

    if measB

    ReadTempB='KRDG?B';
    writeline(Lakeshore,ReadTempB);
    Tb=readline(Lakeshore);
    writeline(Lakeshore,ReadTempB);
    Tb=readline(Lakeshore);% dummy because first one sometimes doesn't work
    pause(0.01)

    else
        Tb = NaN;
    end

    if measC

    ReadTempC='KRDG?C';
    writeline(Lakeshore,ReadTempC);
    Tc=readline(Lakeshore);
    writeline(Lakeshore,ReadTempC);
    Tc=readline(Lakeshore);% dummy because first one sometimes doesn't work
    pause(0.01)

    else
        Tc = NaN;
    end

    if measD

    ReadTempD='KRDG?D';
    writeline(Lakeshore,ReadTempD);
    Td=readline(Lakeshore);
    writeline(Lakeshore,ReadTempD);
    Td=readline(Lakeshore);% dummy because first one sometimes doesn't work
    pause(0.01)

    else
        Td = NaN;
    end

    T.Ta=str2double(Ta);
    T.Tb=str2double(Tb);
    T.Tc=str2double(Tc);
    T.Td=str2double(Td);

else
    T.Ta = NaN;
    T.Tb = NaN;
    T.Tc = NaN;
    T.Td = NaN;
end

end
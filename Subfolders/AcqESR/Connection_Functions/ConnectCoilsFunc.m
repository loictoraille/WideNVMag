function ConnectCoilsFunc()
global TestWithoutHardware


if ~TestWithoutHardware

panel=guidata(gcbo);

MCC = daq("mcc");

addoutput(MCC,"Board0","Ao0","Voltage");
addoutput(MCC,"Board0","Ao1","Voltage");
addoutput(MCC,"Board0","Ao2","Voltage");
addoutput(MCC,"Board0","Ao3","Voltage");

panel.UserData.MCC = MCC;

guidata(gcbo,panel);

if exist('MCC','var') && ~isempty(MCC) 
    ConnectionString = 'Connected';
    ConnectionColor = 'b';
else
    ConnectionString = 'NOT connected';
    ConnectionColor = 'r';
end

panel.ConnectionCoils.String = ConnectionString;
panel.ConnectionCoils.ForegroundColor = ConnectionColor;

end
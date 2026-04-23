function BButtonCall(~,~)
global TestWithoutHardware

panel=guidata(gcbo);

if TestWithoutHardware~=1 && isfield(panel,'UserData') && ~isfield(panel.UserData,'MCC')
    ConnectCoilsFunc();
end

Update_Tension();

end
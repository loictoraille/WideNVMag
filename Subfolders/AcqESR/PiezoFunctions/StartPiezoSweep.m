function StartPiezoSweep(axisName)

global NI_card TestWithoutHardware

panel = guidata(gcbo);

if isempty(NI_card) && TestWithoutHardware == 0
    error('NI_card not initialized');
end

mousePos = get(0,'PointerLocation'); % [x y] in screen pixels
figWidth = 250;
figHeight = 120;

% create stop window
hFig = figure( ...
    'Name','Piezo sweep running', ...
    'NumberTitle','off', ...
    'MenuBar','none', ...
    'ToolBar','none', ...
    'Position',[mousePos(1)-figWidth/2 mousePos(2)-figHeight/2 figWidth figHeight], ...
    'CloseRequestFcn',@onClose);

setappdata(hFig,'StopRequested',false);

uicontrol( ...
    'Parent',hFig,...
    'Style','pushbutton', ...
    'String','STOP', ...
    'FontSize',12, ...
    'Position',[50 30 150 50], ...
    'Callback',@stopCallback);

drawnow;

% time limit (5 min)
tStart = tic;
tMax = 5*60;

% save initial state
IniX = str2double(panel.piezoX.String);
IniY = str2double(panel.piezoY.String);
IniZ = str2double(panel.piezoZ.String);
IniLight = panel.light.Value;
IniLaser = panel.shutterlaser.Value;

% start from position 0
X = 0;
Y = 0;
Z = 0;
L = 0;
laser_state = true;

step = 1;
direction = 1;

while true

    % timeout
    if toc(tStart) > tMax
        break;
    end

    % stop button
    if ~isvalid(hFig)
        break;
    end

    if getappdata(hFig,'StopRequested')
        break;
    end

    if TestWithoutHardware ~= 1

        switch upper(axisName)

            case 'X'
                [X,direction] = sweepAxis(NI_card,X,Y,Z,L,laser_state,'X',step,direction,IniY);

            case 'Y'
                [Y,direction] = sweepAxis(NI_card,X,Y,Z,L,laser_state,'Y',step,direction,IniX);

        end

    else

        disp('sweeping axis');
        pause(0.05);

    end

    drawnow;

end

% restore initial values

if TestWithoutHardware ~= 1

    CheckMaxAndWriteNI(IniX,IniY,IniZ,IniLight,IniLaser);

else

    disp('resetting');

end

if isvalid(hFig)
    delete(hFig);
end

    function stopCallback(~,~)

        if isvalid(hFig)
            setappdata(hFig,'StopRequested',true);
        end

    end

    function onClose(~,~)

        if isvalid(hFig)
            setappdata(hFig,'StopRequested',true);
            delete(hFig);
        end

    end

end
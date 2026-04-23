
%%Elements of Tab Control Coils (Matesy version)
load([getPath('Param') 'AcqParameters.mat']);

TAB = tab_controlcoil;

%% Calibration elements

VerticalPosition = 0.05;
LateralPosition = -0.05;
Height = 0.15;
WidthStep = 0.2;
Denomination = 'Coils Calibration';

hB = 1.3*(Height/3-Height/30);
widthB = WidthStep/2.5;
FtSize = Height*100;
InputSizeIncrease = WidthStep/10;
OffsetVertical = -0.013;
OffsetHorizontal = -0.02;

uicontrol('Parent',TAB,'Style','text','units','normalized','FontSize',FtSize,'Position',[LateralPosition+WidthStep/10 VerticalPosition+2*Height/3+OffsetVertical 2*widthB hB],'String','Bxc = ');
Calib_x_handle=uicontrol('Parent',TAB,'Style','edit','tag','XcoilCalib','units','normalized','FontSize',FtSize,'Position',[LateralPosition+WidthStep/10+1.5*widthB VerticalPosition+2*Height/3 widthB+InputSizeIncrease hB],'String',num2str(AcqParameters.XcoilCalib),'Callback',@UpdateAcqParam);
uicontrol('Parent',TAB,'Style','text','units','normalized','FontSize',FtSize,'Position',[LateralPosition+WidthStep/10+2.5*widthB+2*InputSizeIncrease+OffsetHorizontal VerticalPosition+2*Height/3+OffsetVertical widthB hB],'String','mT/V');
uicontrol('Parent',TAB,'Style','text','units','normalized','FontSize',FtSize,'Position',[LateralPosition+WidthStep/10 VerticalPosition+Height/3+OffsetVertical 2*widthB hB],'String','Byc = ');
Calib_y_handle=uicontrol('Parent',TAB,'Style','edit','tag','YcoilCalib','units','normalized','FontSize',FtSize,'Position',[LateralPosition+WidthStep/10+1.5*widthB VerticalPosition+Height/3 widthB+InputSizeIncrease hB],'String',num2str(AcqParameters.YcoilCalib),'Callback',@UpdateAcqParam);
uicontrol('Parent',TAB,'Style','text','units','normalized','FontSize',FtSize,'Position',[LateralPosition+WidthStep/10+2.5*widthB+2*InputSizeIncrease+OffsetHorizontal VerticalPosition+Height/3+OffsetVertical widthB hB],'String','mT/V');
uicontrol('Parent',TAB,'Style','text','units','normalized','FontSize',FtSize,'Position',[LateralPosition+WidthStep/10 VerticalPosition+OffsetVertical 2*widthB hB],'String','Bzc = ');
Calib_z_handle=uicontrol('Parent',TAB,'Style','edit','tag','ZcoilCalib','units','normalized','FontSize',FtSize,'Position',[LateralPosition+WidthStep/10+1.5*widthB VerticalPosition widthB+InputSizeIncrease hB],'String',num2str(AcqParameters.ZcoilCalib),'Callback',@UpdateAcqParam);
uicontrol('Parent',TAB,'Style','text','units','normalized','FontSize',FtSize,'Position',[LateralPosition+WidthStep/10+2.5*widthB+2*InputSizeIncrease+OffsetHorizontal VerticalPosition+OffsetVertical widthB hB],'String','mT/V');

TextInfo_Handle=uicontrol('Parent',TAB,'Style','text','units','normalized','FontSize',FtSize+3,'FontWeight','bold','Position',[LateralPosition-InputSizeIncrease+0.5*OffsetHorizontal  VerticalPosition+1.1*Height 2.25*WidthStep 0.4*Height],'String',Denomination);

%% Current state

VerticalPosition = 0.03;
LateralPosition = 0.18;
Height = 0.15;
WidthStep = 0.2;
Denomination = 'Current State';

hB = 1.3*(Height/3-Height/30);
widthB = WidthStep/2.5;
FtSize = Height*100;
InputSizeIncrease = WidthStep/10;

uicontrol('Parent',TAB,'Style','text','tag','Vxc','units','normalized','FontSize',FtSize,'HorizontalAlignment','left','Position',[LateralPosition+2.8*widthB VerticalPosition+2*Height/3 3*widthB hB],'String','Vxc = 0 V','HorizontalAlignment','left','Value',0);
uicontrol('Parent',TAB,'Style','text','tag','Vyc','units','normalized','FontSize',FtSize,'HorizontalAlignment','left','Position',[LateralPosition+2.8*widthB VerticalPosition+Height/3 3*widthB hB],'String','Vyc = 0 V','HorizontalAlignment','left','Value',0);
uicontrol('Parent',TAB,'Style','text','tag','Vzc','units','normalized','FontSize',FtSize,'HorizontalAlignment','left','Position',[LateralPosition+2.8*widthB VerticalPosition 3*widthB hB],'String','Vzc = 0 V','HorizontalAlignment','left','Value',0);

uicontrol('Parent',TAB,'Style','text','tag','CoilState','units','normalized','FontSize',FtSize+5,'FontWeight','bold','ForegroundColor','r','Position',[LateralPosition+1.1*widthB VerticalPosition+Height/3-hB/5 1.5*widthB 1.3*hB],'String','OFF','HorizontalAlignment','right');

TextInfo_Handle=uicontrol('Parent',TAB,'Style','text','units','normalized','FontSize',FtSize+3,'FontWeight','bold','Position',[LateralPosition+1.4*widthB VerticalPosition+1.1*Height 1.5*WidthStep 0.4*Height],'String',Denomination);

%% Coil Components

VerticalPosition = 0.4;
LateralPosition = 0.01;
Height = 0.15;
WidthStep = 0.2;
Denomination = 'Coil Components';

hB = 1.3*(Height/3-Height/30);
widthB = WidthStep/2.5;
FtSize = Height*100;
InputSizeIncrease = WidthStep/10;
Bstart = floor(sqrt(AcqParameters.BxCoil^2+AcqParameters.ByCoil^2+AcqParameters.BzCoil^2)*100)/100;
OffsetVertical = -0.013;
OffsetHorizontal = 0.02;

BButton=uicontrol('Parent',TAB,'Style','togglebutton','String','OFF','units','normalized','tag','Bbutton',...
    'Position', [LateralPosition+0.6*WidthStep VerticalPosition+Height/35+0.3*Height WidthStep/3 Height/2],'FontSize',FtSize+5,'FontWeight','bold','ForegroundColor','r',...
    'Value',0,'Callback',@BButtonCall);

uicontrol('Parent',TAB,'Style','text','units','normalized','FontSize',FtSize,'Position',[LateralPosition+1.05*WidthStep+OffsetHorizontal VerticalPosition+2*Height/3+OffsetVertical 1.5*widthB hB],'String','Bxc = ','HorizontalAlignment','left');
B_x_handle=uicontrol('Parent',TAB,'Style','edit','tag','BxCoil','units','normalized','FontSize',FtSize,'Position',[LateralPosition+WidthStep+WidthStep/10+widthB VerticalPosition+2*Height/3 widthB+InputSizeIncrease hB],'String',num2str(AcqParameters.BxCoil),'Callback',@B_Comp);
uicontrol('Parent',TAB,'Style','text','units','normalized','FontSize',FtSize,'Position',[LateralPosition+WidthStep+WidthStep/10+2*widthB+InputSizeIncrease VerticalPosition+2*Height/3+OffsetVertical widthB hB],'String','mT');
uicontrol('Parent',TAB,'Style','text','units','normalized','FontSize',FtSize,'Position',[LateralPosition+1.05*WidthStep+OffsetHorizontal VerticalPosition+Height/3+OffsetVertical 1.5*widthB hB],'String','Byc = ','HorizontalAlignment','left');
B_y_handle=uicontrol('Parent',TAB,'Style','edit','tag','ByCoil','units','normalized','FontSize',FtSize,'Position',[LateralPosition+WidthStep+WidthStep/10+widthB VerticalPosition+Height/3 widthB+InputSizeIncrease hB],'String',num2str(AcqParameters.ByCoil),'Callback',@B_Comp);
uicontrol('Parent',TAB,'Style','text','units','normalized','FontSize',FtSize,'Position',[LateralPosition+WidthStep+WidthStep/10+2*widthB+InputSizeIncrease VerticalPosition+Height/3+OffsetVertical widthB hB],'String','mT');
uicontrol('Parent',TAB,'Style','text','units','normalized','FontSize',FtSize,'Position',[LateralPosition+1.05*WidthStep+OffsetHorizontal VerticalPosition+OffsetVertical 1.5*widthB hB],'String','Bzc = ','HorizontalAlignment','left');
B_z_handle=uicontrol('Parent',TAB,'Style','edit','tag','BzCoil','units','normalized','FontSize',FtSize,'Position',[LateralPosition+WidthStep+WidthStep/10+widthB VerticalPosition widthB+InputSizeIncrease hB],'String',num2str(AcqParameters.BzCoil),'Callback',@B_Comp);
uicontrol('Parent',TAB,'Style','text','units','normalized','FontSize',FtSize,'Position',[LateralPosition+WidthStep+WidthStep/10+2*widthB+InputSizeIncrease VerticalPosition+OffsetVertical widthB hB],'String','mT');

B_norm_1=uicontrol('Parent',TAB,'Style','text','String',num2str(Bstart),'Style','edit',...
    'tag','BnormCoil','units','normalized','FontSize',FtSize,'FontWeight','bold','Position', [LateralPosition+2.3*widthB VerticalPosition-1.2*Height/3+OffsetVertical widthB hB],'Callback',@B_normFunction);
B_norm_2=uicontrol('Parent',TAB,'Style','text','string','B = ',...
    'units','normalized','FontSize',FtSize,'FontWeight','bold','Position', [LateralPosition+1.3*widthB VerticalPosition-1.2*Height/3+2*OffsetVertical widthB hB],'HorizontalAlignment','right');
B_norm_3=uicontrol('Parent',TAB,'Style','text','string',' mT',...
    'units','normalized','FontSize',FtSize,'FontWeight','bold','Position', [LateralPosition+3.3*widthB VerticalPosition-1.2*Height/3+2*OffsetVertical widthB hB],'HorizontalAlignment','left');

TextInfo_Handle=uicontrol('Parent',TAB,'Style','text','units','normalized','FontSize',FtSize+3,'FontWeight','bold','Position',[LateralPosition VerticalPosition+1.05*Height 2.25*WidthStep 0.35*Height],'String',Denomination);

%% Diamond Components
% nonsensical for diamond anvil cells where the axes are undefined, contrary to using Advice

% VerticalPosition = 0.38;
% LateralPosition = 0.5;
% Height = 0.15;
% WidthStep = 0.2;
% Denomination = 'Diamond Components';
% 
% Starting_x = 2;
% Starting_y = 3;
% Starting_z = 1;
% 
% hB = 1.3*(Height/3-Height/30);
% widthB = WidthStep/2.5;
% FtSize = Height*100;
% InputSizeIncrease = WidthStep/10;
% Bstart = floor(sqrt(Starting_x^2+Starting_y^2+Starting_z^2)*100)/100;
% OffsetVertical = -0.013;
% OffsetHorizontal = 0.02;
% 
% BButton=uicontrol('Parent',TAB,'Style','togglebutton','String','OFF','units','normalized','tag','Bd',...
%     'Position', [LateralPosition+0.6*WidthStep VerticalPosition+Height/35+0.3*Height WidthStep/3 Height/2],'FontSize',FtSize+5,'FontWeight','bold','ForegroundColor',[1,0,0],...
%     'Value',0,'Callback',@BsFunction);
% 
% uicontrol('Parent',TAB,'Style','text','units','normalized','FontSize',FtSize,'Position',[LateralPosition+1.05*WidthStep+OffsetHorizontal VerticalPosition+2*Height/3+OffsetVertical 1.5*widthB hB],'String','Bxd = ','HorizontalAlignment','left');
% Bd_x_handle=uicontrol('Parent',TAB,'Style','edit','tag','Bd_x','units','normalized','FontSize',FtSize,'Position',[LateralPosition+WidthStep+WidthStep/10+widthB VerticalPosition+2*Height/3 widthB+InputSizeIncrease hB],'String',num2str(Starting_x),'Callback',@Bd_CompFunction,'Value',Starting_x);
% uicontrol('Parent',TAB,'Style','text','units','normalized','FontSize',FtSize,'Position',[LateralPosition+WidthStep+WidthStep/10+2*widthB+InputSizeIncrease VerticalPosition+2*Height/3+OffsetVertical widthB hB],'String','mT');
% uicontrol('Parent',TAB,'Style','text','units','normalized','FontSize',FtSize,'Position',[LateralPosition+1.05*WidthStep+OffsetHorizontal VerticalPosition+Height/3+OffsetVertical 1.5*widthB hB],'String','Byd = ','HorizontalAlignment','left');
% Bd_y_handle=uicontrol('Parent',TAB,'Style','edit','tag','Bd_y','units','normalized','FontSize',FtSize,'Position',[LateralPosition+WidthStep+WidthStep/10+widthB VerticalPosition+Height/3 widthB+InputSizeIncrease hB],'String',num2str(Starting_y),'Callback',@Bd_CompFunction,'Value',Starting_y);
% uicontrol('Parent',TAB,'Style','text','units','normalized','FontSize',FtSize,'Position',[LateralPosition+WidthStep+WidthStep/10+2*widthB+InputSizeIncrease VerticalPosition+Height/3+OffsetVertical widthB hB],'String','mT');
% uicontrol('Parent',TAB,'Style','text','units','normalized','FontSize',FtSize,'Position',[LateralPosition+1.05*WidthStep+OffsetHorizontal VerticalPosition+OffsetVertical 1.5*widthB hB],'String','Bzd = ','HorizontalAlignment','left');
% Bd_z_handle=uicontrol('Parent',TAB,'Style','edit','tag','Bd_z','units','normalized','FontSize',FtSize,'Position',[LateralPosition+WidthStep+WidthStep/10+widthB VerticalPosition widthB+InputSizeIncrease hB],'String',num2str(Starting_z),'Callback',@Bd_CompFunction,'Value',Starting_z);
% uicontrol('Parent',TAB,'Style','text','units','normalized','FontSize',FtSize,'Position',[LateralPosition+WidthStep+WidthStep/10+2*widthB+InputSizeIncrease VerticalPosition+OffsetVertical widthB hB],'String','mT');
% 
% Bd_norm_1=uicontrol('Parent',TAB,'Style','text','string',num2str(Bstart),'Value',Bstart,'Style','edit',...
%     'tag','Bd_norm','units','normalized','FontSize',FtSize,'FontWeight','bold','Position', [LateralPosition+2.3*widthB VerticalPosition-1.2*Height/3+OffsetVertical widthB hB],'Callback',@Bd_normFunction);
% Bd_norm_2=uicontrol('Parent',TAB,'Style','text','string','B = ',...
%     'units','normalized','FontSize',FtSize,'FontWeight','bold','Position', [LateralPosition+1.3*widthB VerticalPosition-1.2*Height/3+2*OffsetVertical widthB hB],'HorizontalAlignment','right');
% Bd_norm_3=uicontrol('Parent',TAB,'Style','text','string',' mT',...
%     'units','normalized','FontSize',FtSize,'FontWeight','bold','Position', [LateralPosition+3.3*widthB VerticalPosition-1.2*Height/3+2*OffsetVertical widthB hB],'HorizontalAlignment','left');
% 
% 
% TextInfo_Handle=uicontrol('Parent',TAB,'Style','text','units','normalized','FontSize',FtSize+3,'FontWeight','bold','Position',[LateralPosition VerticalPosition+1.05*Height 2.25*WidthStep 0.35*Height],'String',Denomination);


%% Axes definition
% nonsensical for diamond anvil cells where the axes are undefined, contrary to using Advice
% 
% VerticalPosition = 0.62;
% LateralPosition = 0.01;
% Height = 0.15;
% WidthStep = 0.2;
% Denomination = 'Axes Definition';
% 
% hB = 1.3*(Height/3-Height/30);
% widthB = WidthStep/2.5;
% FtSize = Height*100;
% InputSizeIncrease = WidthStep/10;
% Bstart = floor(sqrt(Starting_x^2+Starting_y^2+Starting_z^2)*100)/100;
% OffsetVertical = -0.006;
% OffsetHorizontal = 0.02;
% 
% uicontrol('Parent',TAB,'Style','pushbutton','String','Cryo','units','normalized','tag','CryoRec',...
%     'Position', [LateralPosition+OffsetHorizontal VerticalPosition+0.95*Height 0.5*WidthStep Height/3],'FontSize',FtSize,...
%     'Value',0,'Callback',@RecallAxesFunction);
% uicontrol('Parent',TAB,'Style','pushbutton','String','Store','units','normalized','tag','CryoStore',...
%     'Position', [LateralPosition+0.5*WidthStep+OffsetHorizontal VerticalPosition+0.95*Height 0.5*WidthStep Height/3],'FontSize',FtSize,...
%     'Value',0,'Callback',@StoreAxesFunction);
% uicontrol('Parent',TAB,'Style','pushbutton','String','Geo','units','normalized','tag','GeoRec',...
%     'Position', [LateralPosition+OffsetHorizontal VerticalPosition+0.6*Height 0.5*WidthStep Height/3],'FontSize',FtSize,...
%     'Value',0,'Callback',@RecallAxesFunction);
% uicontrol('Parent',TAB,'Style','pushbutton','String','Store','units','normalized','tag','GeoStore',...
%     'Position', [LateralPosition+0.5*WidthStep+OffsetHorizontal VerticalPosition+0.6*Height 0.5*WidthStep Height/3],'FontSize',FtSize,...
%     'Value',0,'Callback',@StoreAxesFunction);
% uicontrol('Parent',TAB,'Style','pushbutton','String','User','units','normalized','tag','UserRec',...
%     'Position', [LateralPosition+OffsetHorizontal VerticalPosition+0.25*Height 0.5*WidthStep Height/3],'FontSize',FtSize,...
%     'Value',0,'Callback',@RecallAxesFunction);
% uicontrol('Parent',TAB,'Style','pushbutton','String','Store','units','normalized','tag','UserStore',...
%     'Position', [LateralPosition+0.5*WidthStep+OffsetHorizontal VerticalPosition+0.25*Height 0.5*WidthStep Height/3],'FontSize',FtSize,...
%     'Value',0,'Callback',@StoreAxesFunction);
% 
% uicontrol('Parent',TAB,'Style','text','units','normalized','FontSize',FtSize,'Position',[LateralPosition+WidthStep+WidthStep/10 VerticalPosition+0.9*Height+OffsetVertical widthB Height/3],'String','xc = ');
% uicontrol('Parent',TAB,'Style','edit','tag','xc','units','normalized','FontSize',FtSize,'Position',[LateralPosition+WidthStep+WidthStep/10+widthB VerticalPosition+0.95*Height widthB Height/3],'String','xd','Callback',@Bd_axesFunction);
% uicontrol('Parent',TAB,'Style','text','units','normalized','FontSize',FtSize,'Position',[LateralPosition+WidthStep+WidthStep/10 VerticalPosition+0.55*Height+OffsetVertical widthB Height/3],'String','yc = ');
% uicontrol('Parent',TAB,'Style','edit','tag','yc','units','normalized','FontSize',FtSize,'Position',[LateralPosition+WidthStep+WidthStep/10+widthB VerticalPosition+0.6*Height widthB Height/3],'String','yd','Callback',@Bd_axesFunction);
% uicontrol('Parent',TAB,'Style','text','units','normalized','FontSize',FtSize,'Position',[LateralPosition+WidthStep+WidthStep/10 VerticalPosition+0.2*Height+OffsetVertical widthB Height/3],'String','zc = ');
% uicontrol('Parent',TAB,'Style','edit','tag','zc','units','normalized','FontSize',FtSize,'Position',[LateralPosition+WidthStep+WidthStep/10+widthB VerticalPosition+0.25*Height widthB Height/3],'String','zd','Callback',@Bd_axesFunction);
% 
% 
% TextInfo_Handle=uicontrol('Parent',TAB,'Style','text','units','normalized','FontSize',FtSize+3,'FontWeight','bold','Position',[LateralPosition-0.25*widthB+OffsetHorizontal VerticalPosition+1.3*Height 2.25*WidthStep 0.4*Height],'String',Denomination);

%% Corresponding Coil Components
% nonsensical for diamond anvil cells where the axes are undefined, contrary to using Advice
% 
% VerticalPosition = 0.17;
% LateralPosition = 0.66;
% Height = 0.15;
% WidthStep = 0.2;
% Denomination = 'Corresponds to (mT)';
% 
% hB = 1.3*(Height/3-Height/30);
% widthB = WidthStep/5;
% FtSize = Height*100;
% InputSizeIncrease = WidthStep/10;
% OffsetHorizontal = -0.08;
% 
% uicontrol('Parent',TAB,'Style','text','units','normalized','FontSize',FtSize,'HorizontalAlignment','left','Position',[LateralPosition-widthB VerticalPosition+0.1*hB 3*widthB hB],'String','Bxc = ','HorizontalAlignment','left','ForegroundColor',[0,0,1]);
% uicontrol('Parent',TAB,'Style','text','tag','Bxcd','units','normalized','FontSize',FtSize,'HorizontalAlignment','left','Position',[LateralPosition VerticalPosition+0.1*hB 3*widthB hB],'String','-0.00','HorizontalAlignment','left','ForegroundColor',[0,0,1],'Value',0);
% uicontrol('Parent',TAB,'Style','text','units','normalized','FontSize',FtSize,'HorizontalAlignment','left','Position',[LateralPosition+widthB VerticalPosition+0.1*hB 3*widthB hB],'String','Byc = ','HorizontalAlignment','left','ForegroundColor',[0,0,1]);
% uicontrol('Parent',TAB,'Style','text','tag','Bycd','units','normalized','FontSize',FtSize,'HorizontalAlignment','left','Position',[LateralPosition+2*widthB VerticalPosition+0.1*hB 3*widthB hB],'String','-0.00','HorizontalAlignment','left','ForegroundColor',[0,0,1],'Value',0);
% uicontrol('Parent',TAB,'Style','text','units','normalized','FontSize',FtSize,'HorizontalAlignment','left','Position',[LateralPosition+3*widthB VerticalPosition+0.1*hB 3*widthB hB],'String','Bzc = ','HorizontalAlignment','left','ForegroundColor',[0,0,1]);
% uicontrol('Parent',TAB,'Style','text','tag','Bzcd','units','normalized','FontSize',FtSize,'HorizontalAlignment','left','Position',[LateralPosition+4*widthB VerticalPosition+0.1*hB 3*widthB hB],'String','-0.00','HorizontalAlignment','left','ForegroundColor',[0,0,1],'Value',0);
% 
% TextInfo_Handle=uicontrol('Parent',TAB,'Style','text','units','normalized','FontSize',FtSize+3,'FontWeight','bold','Position',[LateralPosition-0.2*widthB+OffsetHorizontal VerticalPosition+0.4*Height 1.5*WidthStep 0.3*Height],'String',Denomination,'ForegroundColor',[0,0,1]);
% 
% Correspond_function();

%% Preset Parameters

VerticalPosition = 0.73;
LateralPosition = 0.1;
Height = 0.15;
WidthStep = 0.2;

hB = 1.3*(Height/3-Height/30);
widthB = WidthStep/2.5;
FtSize = Height*100;
Denomination = 'Preset parameters';

VerticalUp = VerticalPosition+0.95*Height;
OffsetVertical = -0.01;
OffsetHorizontal = 0.02;

TextInfo_Handle=uicontrol('Parent',TAB,'Style','text','units','normalized','FontSize',FtSize+3,'FontWeight','bold','Position',[LateralPosition-0.1*widthB VerticalPosition+1.3*Height 1.5*WidthStep 0.4*Height],'String',Denomination);

uicontrol('Parent',TAB,'Style','pushbutton','String','B1','units','normalized','tag','B1Rec',...
    'Position', [LateralPosition+OffsetHorizontal VerticalUp 0.5*WidthStep Height/3],'FontSize',FtSize,...
    'Value',0,'Callback',@RecallAllFunction);
uicontrol('Parent',TAB,'Style','pushbutton','String','Store','units','normalized','tag','B1Store',...
    'Position', [LateralPosition+0.5*WidthStep+OffsetHorizontal VerticalUp 0.5*WidthStep Height/3],'FontSize',FtSize,...
    'Value',0,'Callback',@StoreAllFunction);
uicontrol('Parent',TAB,'Style','text','units','normalized','FontSize',FtSize,'Position',[LateralPosition+1.1*WidthStep+OffsetHorizontal VerticalUp+OffsetVertical WidthStep Height/3],'String','Split 4','HorizontalAlignment','left');

VerticalUp = VerticalPosition+0.6*Height;
uicontrol('Parent',TAB,'Style','pushbutton','String','B2','units','normalized','tag','B2Rec',...
    'Position', [LateralPosition+OffsetHorizontal VerticalUp 0.5*WidthStep Height/3],'FontSize',FtSize,...
    'Value',0,'Callback',@RecallAllFunction);
uicontrol('Parent',TAB,'Style','pushbutton','String','Store','units','normalized','tag','B2Store',...
    'Position', [LateralPosition+0.5*WidthStep+OffsetHorizontal VerticalUp 0.5*WidthStep Height/3],'FontSize',FtSize,...
    'Value',0,'Callback',@StoreAllFunction);
uicontrol('Parent',TAB,'Style','text','units','normalized','FontSize',FtSize,'Position',[LateralPosition+1.1*WidthStep+OffsetHorizontal VerticalUp+OffsetVertical WidthStep Height/3],'String','All equal','HorizontalAlignment','left');

VerticalUp = VerticalPosition+0.25*Height;
uicontrol('Parent',TAB,'Style','pushbutton','String','B3','units','normalized','tag','B3Rec',...
    'Position', [LateralPosition+OffsetHorizontal VerticalUp 0.5*WidthStep Height/3],'FontSize',FtSize,...
    'Value',0,'Callback',@RecallAllFunction);
uicontrol('Parent',TAB,'Style','pushbutton','String','Store','units','normalized','tag','B3Store',...
    'Position', [LateralPosition+0.5*WidthStep+OffsetHorizontal VerticalUp 0.5*WidthStep Height/3],'FontSize',FtSize,...
    'Value',0,'Callback',@StoreAllFunction);
uicontrol('Parent',TAB,'Style','text','units','normalized','FontSize',FtSize,'Position',[LateralPosition+1.1*WidthStep+OffsetHorizontal VerticalUp+OffsetVertical WidthStep Height/3],'String','1 only','HorizontalAlignment','left');

VerticalUp = VerticalPosition-0.1*Height;
uicontrol('Parent',TAB,'Style','pushbutton','String','B4','units','normalized','tag','B4Rec',...
    'Position', [LateralPosition+OffsetHorizontal VerticalUp 0.5*WidthStep Height/3],'FontSize',FtSize,...
    'Value',0,'Callback',@RecallAllFunction);
uicontrol('Parent',TAB,'Style','pushbutton','String','Store','units','normalized','tag','B4Store',...
    'Position', [LateralPosition+0.5*WidthStep+OffsetHorizontal VerticalUp 0.5*WidthStep Height/3],'FontSize',FtSize,...
    'Value',0,'Callback',@StoreAllFunction);
uicontrol('Parent',TAB,'Style','text','units','normalized','FontSize',FtSize,'Position',[LateralPosition+1.1*WidthStep+OffsetHorizontal VerticalUp+OffsetVertical WidthStep Height/3],'String','User1','HorizontalAlignment','left');

VerticalUp = VerticalPosition-0.45*Height;
uicontrol('Parent',TAB,'Style','pushbutton','String','B5','units','normalized','tag','B5Rec',...
    'Position', [LateralPosition+OffsetHorizontal VerticalUp 0.5*WidthStep Height/3],'FontSize',FtSize,...
    'Value',0,'Callback',@RecallAllFunction);
uicontrol('Parent',TAB,'Style','pushbutton','String','Store','units','normalized','tag','B5Store',...
    'Position', [LateralPosition+0.5*WidthStep+OffsetHorizontal VerticalUp 0.5*WidthStep Height/3],'FontSize',FtSize,...
    'Value',0,'Callback',@StoreAllFunction);
uicontrol('Parent',TAB,'Style','text','units','normalized','FontSize',FtSize,'Position',[LateralPosition+1.1*WidthStep+OffsetHorizontal VerticalUp+OffsetVertical WidthStep Height/3],'String','User2','HorizontalAlignment','left');


%% Connection

VerticalPosition = 0.83;
LateralPosition = 0.65;
Height = 0.1;
Width = 0.2;

FtSize = 2*Height*100+3;

ConnectionString = 'NOT connected';
ConnectionColor = 'r';
    
TextInfo_Handle=uicontrol('Parent',TAB,'Style','text','tag','ConnectionCoils','units','normalized','FontSize',FtSize,'FontWeight','bold','Position',[LateralPosition VerticalPosition Width Height],'String',ConnectionString,'ForegroundColor',ConnectionColor);

% not needed, the OFF button does the connection as well
% uicontrol('Parent',TAB,'Style','pushbutton','String','Connect Coils','units','normalized','tag','ConnectCoilsButton',...
%     'Position', [LateralPosition+0.175*Width VerticalPosition-0.05 0.65*Width 0.75*Height],'FontSize',FtSize,'FontWeight','bold','Callback',@ConnectCoils);



function RecallAllFunction(hobject,~)

panel=guidata(gcbo);

nametag = get(hobject,'tag'); 

if strcmp(nametag,'B1Rec')
    name_file = 'Split4';
elseif strcmp(nametag,'B2Rec')
    name_file = 'AllEqual';
elseif strcmp(nametag,'B3Rec')
    name_file = '1only';
elseif strcmp(nametag,'B4Rec')
    name_file = panel.Bname_User1.String;
elseif strcmp(nametag,'B5Rec')
    name_file = panel.Bname_User2.String;
end

name_file =[name_file '_Full'];


fid = fopen([getPath('Param') 'Preset_Fields/' name_file '.txt'], 'r');
if fid ~= -1
    fidString = fscanf(fid,'%s');
    fclose(fid);
    
    tokens = regexp(fidString, 'Bxc=([\d.\-]+)mTByc=([\d.\-]+)mTBzc=([\d.\-]+)mT', 'tokens');
    BxCoil = str2double(tokens{1}{1});
    ByCoil = str2double(tokens{1}{2});
    BzCoil = str2double(tokens{1}{3});
else
    BxCoil = str2double(panel.BxCoil.String);ByCoil = str2double(panel.ByCoil.String);BzCoil = str2double(panel.BzCoil.String);
    disp('Unable to load field param, invalid file name')
end

panel.BxCoil.String = num2str(BxCoil);
panel.ByCoil.String = num2str(ByCoil);
panel.BzCoil.String = num2str(BzCoil);

new_B_norm = sqrt(BxCoil^2+ByCoil^2+BzCoil^2);
panel.BnormCoil.String = num2str(round(new_B_norm*100)/100);

Update_Tension();

end
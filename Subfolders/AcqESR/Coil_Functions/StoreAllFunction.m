
function StoreAllFunction(hobject,~)

panel=guidata(gcbo);

nametag = get(hobject,'tag');

if strcmp(nametag,'B1Store')
    name_file = 'Split4';
elseif strcmp(nametag,'B2Store')
    name_file = 'AllEqual';
elseif strcmp(nametag,'B3Store')
    name_file = '1only';
elseif strcmp(nametag,'B4Store')
    name_file = panel.Bname_User1.String;
elseif strcmp(nametag,'B5Store')
    name_file = panel.Bname_User2.String;
end

name_file =[name_file '_Full'];

BxCoilString = panel.BxCoil.String;
ByCoilString = panel.ByCoil.String;
BzCoilString = panel.BzCoil.String;

StoreFullString = ['Bxc = ' BxCoilString ' mT\nByc = ' ByCoilString ' mT\nBzc = ' BzCoilString ' mT'];

fid = fopen([getPath('Param') '/Preset_Fields/' name_file '.txt'],'wt');
fprintf(fid, StoreFullString);
fclose(fid);

end

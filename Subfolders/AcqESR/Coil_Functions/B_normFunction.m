
function B_normFunction(~,~)

panel=guidata(gcbo);

BxCoil = str2double(panel.BxCoil.String);
ByCoil = str2double(panel.ByCoil.String);
BzCoil = str2double(panel.BzCoil.String);
BnormCoil = str2double(panel.BnormCoil.String);

OldBnorm = sqrt(BxCoil^2+ByCoil^2+BzCoil^2);

NewBnorm = BnormCoil;
Ratio = NewBnorm/OldBnorm;

NewB_x = BxCoil*Ratio;
NewB_y = ByCoil*Ratio;
NewB_z = BzCoil*Ratio;

panel.BxCoil.String = num2str(round(NewB_x*100)/100);
panel.ByCoil.String = num2str(round(NewB_y*100)/100);
panel.BzCoil.String = num2str(round(NewB_z*100)/100);

Update_Tension();

end
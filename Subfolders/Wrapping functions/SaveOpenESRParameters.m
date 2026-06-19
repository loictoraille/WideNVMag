function SaveOpenESRParameters(ArgIn)
% Takes any number of parameters in {{value,name}} pair and updates AcqParameters with them

load([getPath('Param') 'OpenESRParameters.mat'],'OpenESRParameters');

for i=1:numel(ArgIn)
    Argi = ArgIn{i};
    eval(['OpenESRParameters.' Argi{2} '= Argi{1};']);      
end      

save([getPath('Param') 'OpenESRParameters.mat'],'OpenESRParameters','-append');   

end
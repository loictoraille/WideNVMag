function [PathOut] = getPath(choice)
%This function retrieves the main path where the script is running, wherever you are starting from
%Can also be used to directly retrieve the AcqESR path, the FitESR path, or the Param path

PathOut = pwd;PathOut(strfind(PathOut,'\')) = '/';
pos_ESRP = strfind(lower(PathOut), lower('Wide'));
if isempty(pos_ESRP)
    disp('The folder name should at least include the word wide.')
    return
else
    pos_slash = strfind(PathOut,'/');
    new_pos_slash = pos_slash(pos_slash>max(pos_ESRP));

    if isempty(new_pos_slash)
        endpos = length(PathOut)+1;
    else
        endpos = new_pos_slash(1);
    end

    MainPath = [PathOut(1:endpos-1) '/'];
    SubPath = [MainPath 'Subfolders/'];

    if strcmp(choice, 'Acq')
        PathOut = [SubPath 'AcqESR/'];
    elseif strcmp(choice, 'Fit')
        PathOut = [SubPath 'FitESR/'];
    elseif strcmp(choice, 'Param')
        PathOut = [SubPath 'Param/'];
    elseif strcmp(choice, 'StartFile')
        PathOut = [SubPath 'Start_and_Test_Files/'];
    else
        PathOut = MainPath;
    end

end

end


function SaveBackupFunction(hobject,~)

set(hobject,'ForegroundColor',[0,0,1]);
drawnow;

tic
disp('saving backup...')

load([getPath('Param') 'AcqParameters.mat']);
Data_Path = AcqParameters.Data_Path;

%% To avoid saving backup as a 'multiscan', rewrite the old content of NameGen
ch = 1;
strIn = AcqParameters.FileNamePrefix;
nomSave = [strIn '-001'];

while exist(fullfile(Data_Path,[nomSave '.mat']), 'file') == 2
    ch = ch + 1;
    nomSave = sprintf('%s-%03d', strIn, ch);
end

%%

% Load everything into a structure
% Slower than copy paste, but compresses the files
S = load([Data_Path 'backup.mat']);

% Save all fields from the structure
save([Data_Path nomSave '.mat'], '-struct', 'S');

disp(['backup saved compressed as ' nomSave '.mat']);

toc

set(hobject,'ForegroundColor',[0,0,0]);
drawnow;

end


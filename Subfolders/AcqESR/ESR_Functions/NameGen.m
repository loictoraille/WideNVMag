function [nomSave, num] = NameGen(pathIn,strIn)

load([getPath('Param') 'AcqParameters.mat'],'AcqParameters');

RepeatScanTag = findobj('tag','RepeatScan');
RepeatScan = str2double(RepeatScanTag.String);

if strcmp(AcqParameters.FileNamePrefixChoice, 'Date+Time')

    nomSave = GenDateTimeName(RepeatScan);

    num = 1;

else

    PATH = pathIn;

    if RepeatScan > 1

        % Find existing MultiScan numbers
        files = dir(fullfile(PATH, [strIn '-MultiScan*-*.mat']));

        maxMultiScan = 0;

        for k = 1:numel(files)

            tok = regexp(files(k).name, ...
                [regexptranslate('escape',strIn) ...
                '-MultiScan(\d+)-\d+\.mat'], ...
                'tokens','once');

            if ~isempty(tok)
                maxMultiScan = max(maxMultiScan, str2double(tok{1}));
            end

        end

        num = 1;
        nomSave = sprintf('%s-MultiScan%d-%03d', ...
                          strIn, maxMultiScan+1, num);

    else

        ch = 1;
        nomSave = [strIn '-001'];

        while exist(fullfile(PATH,[nomSave '.mat']), 'file') == 2
            ch = ch + 1;
            nomSave = sprintf('%s-%03d', strIn, ch);
        end

        num = ch;

    end

end

end
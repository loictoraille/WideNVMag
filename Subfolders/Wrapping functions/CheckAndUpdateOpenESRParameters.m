function OpenESRParameters = CheckAndUpdateOpenESRParameters(String_Default_Value)

% Creates OpenESRParameters.mat if it does not exist and updates it when
% new parameters are added in later versions.

File = [getPath('Param') 'OpenESRParameters.mat'];

% -------------------------------------------------------------------------
% List of parameters and their defaults
% -------------------------------------------------------------------------
fieldNames = {'MaxLumAlwaysAuto','MaxLum','DisplayLightOpenESR'};

defaultValues = {1,4096,1};

% -------------------------------------------------------------------------
% Create file if it does not exist
% -------------------------------------------------------------------------
if ~exist(File,'file')

    OpenESRParameters = struct();

    for i = 1:length(fieldNames)
        OpenESRParameters.(fieldNames{i}) = defaultValues{i};
    end

    save(File,'OpenESRParameters');

end

% -------------------------------------------------------------------------
% Load existing parameters
% -------------------------------------------------------------------------
if ~ismember('OpenESRParameters', who('-file', File))
    OpenESRParameters = struct();
else
    load(File,'OpenESRParameters');
end

% -------------------------------------------------------------------------
% Add missing fields
% -------------------------------------------------------------------------
for i = 1:length(fieldNames)

    fieldName = fieldNames{i};

    if strcmp(String_Default_Value,'default')
        defaultValue = defaultValues{i};
    else
        defaultValue = NaN;
    end

    if ~isfield(OpenESRParameters, fieldName)
        OpenESRParameters.(fieldName) = defaultValue;
    end

end

% -------------------------------------------------------------------------
% Save updated structure
% -------------------------------------------------------------------------
save(File,'OpenESRParameters');

end
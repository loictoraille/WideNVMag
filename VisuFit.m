
clearvars; clear global
addpath(genpath('Subfolders'));addpath(genpath(getPath('Main')));

%% 

[~,~, DataPath, ~] = readConfigFile('Config.txt');

%% Visualize fit results from a FitESR treated data file

[fname,pname] = uigetfile('*.mat','Load file',DataPath);

VisuFitScript;

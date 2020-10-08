close all, clear all, clc, format compact

%% Read data
train_ds = imageDatastore('training_data\train', 'IncludeSubfolders',true,'LabelSource','foldernames');
test_ds = imageDatastore('training_data\test', 'IncludeSubfolders',true,'LabelSource','foldernames');

%% Pre-processing
% Training files for each emotion, limited by the minimum number for a
% given label
numTrainFiles = 1;
numTestFiles = 50;
[imgs_ds_train] = splitEachLabel(train_ds,numTrainFiles,'randomize');
[imgs_ds_test] = splitEachLabel(test_ds,numTestFiles,'randomize');
 
% % Training parameters
% eta = 1e-1; % Learning Rate 0-1   eg .01, .05, .005
% epoch=10;  % Training iterations

inputTrain = arrayfun(@process_img, imgs_ds_train.Files, 'UniformOutput', false);
targetTrain = arrayfun(@process_label, imgs_ds_train.Labels, 'UniformOutput', false);

inputValidation = arrayfun(@process_img, imgs_ds_test.Files, 'UniformOutput', false);
targetValidation = arrayfun(@process_label, imgs_ds_test.Labels, 'UniformOutput', false);

%% Network Training
net = feedforwardnet(36);
net.trainParam.epochs = 1000;

% TODO Esto hace el entrenamiento mucho mas lento.
%net.layers{2}.transferFcn = 'poslin';
%net.layers{1}.transferFcn = 'tansig';
%net.inputs{1}.size = 8;

view(net);
%net.numInputs = 2;
[net, tr, Y, E] = train(net,inputTrain',targetTrain');


%% Simulation
fprintf('------------------------------------\n');
fprintf('Percentage Train Classification :\n');
accuracy(net,inputTrain,targetTrain);



fprintf('------------------------------------\n');
fprintf('Percentage Validation Classification :\n');
accuracy(net,inputValidation,targetValidation);




%% Perf Train
y = net(inputTrain');

perfTrain = perform(net,y,targetTrain');

%% Perf Validation
y = net(inputValidation');
perfValidation = perform(net,y,targetValidation');


%% TODO 
% labels = unique(imgs_ds_test.Labels)

% This input should be pre-processed calling process_img with a cell
% containing the path to the file-image. It is expected to be 48*48 and
% being in grayscale.

% result = sim(net, input') 
% fprintf('Your expression is: %s\n', labels(round(result{1})));
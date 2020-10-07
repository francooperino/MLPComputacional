function [coeffi] = aplicaPCA(img)
 %%img = imread('C:\Users\franc\Desktop\786787_1351797_bundle_archive\train\angry\Training_10120469.jpg');
 %%imshow(img);
 I = double(img);
 

% coeff = pca(I);
%reducedDimension = coeff(:,1:8);
%reducedData = I * reducedDimension;
 %reducedData = reshape(reducedData, 48*8,1);
% 
% [coeff,score] = pca(I);
% reducedDimension = coeff(:,1:8);
% reducedData = I * reducedDimension;
% reducedData = reshape(reducedData, 48*8,1);
% reducedDatacoef=transpose(reducedData);
% reducedDimensionScore = score(:,1:8);
% reducedDataScore = I * reducedDimensionScore;
% 
% reducedDataScore=transpose(reducedDataScore);
numberOfDimensions = 1;
[coeff,score] = pca(I);
reducedDimensioncoef = coeff(:,1:numberOfDimensions);
reducedDimensioncoef=transpose(reducedDimensioncoef);
% reducedDimensionscore = score(:,1:numberOfDimensions);
% reducedDimensionscore=transpose(reducedDimensionscore);
coeffi=reducedDimensioncoef;
%scores=reducedDimensionscore;
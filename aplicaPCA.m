function dataReduce = aplicaPCA(img)
 %%img = imread('C:\Users\franc\Desktop\786787_1351797_bundle_archive\train\angry\Training_10120469.jpg');
 %%imshow(img);
 I = double(img);
 

% coeff = pca(I);
% reducedDimension = coeff(:,1:8);
% reducedData = I * reducedDimension;
% reducedData = reshape(reducedData, 48*8,1);
% 
coeff = pca(I);
reducedDimension = coeff(:,1);
reducedData = I * reducedDimension;
reducedData=transpose(reducedData);
dataReduce= reducedData;
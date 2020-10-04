function [p]= process_img(img_path)
    
%     angles = [0 45 90 135, 180, 225, 270, 315];
%     frequencies = [3.75];
    
    img = imread(img_path{1});
    
    
    
%     gaborMag = imgaborfilt(img, gabor(frequencies,angles));
    
    % TODO Refactor to avoid repetition
    % Each orientation of gabor filter
%     o1 = gaborMag(:,:,1);
%     o2 = gaborMag(:,:,2);
%     o3 = gaborMag(:,:,3);
%     o4 = gaborMag(:,:,4);
%     o5 = gaborMag(:,:,5);
%     o6 = gaborMag(:,:,6);
%     o7 = gaborMag(:,:,7);
%     o8 = gaborMag(:,:,8);
       o1=gaborExample2([2 4],[0 45 90 135 180 225 270 315],img,0);
      
    % Prepare for PCA
%     ov1 = reshape(o1, 48*48,1);
%     ov2 = reshape(o2, 48*48,1);
%     ov3 = reshape(o3, 48*48,1);
%     ov4 = reshape(o4, 48*48,1);
%     ov5 = reshape(o5, 48*48,1);
%     ov6 = reshape(o6, 48*48,1);
%     ov7 = reshape(o7, 48*48,1);
%     ov8 = reshape(o8, 48*48,1);
    %%ov1=reshape(o1,48*48,1);
    % PCA
    %result = pca([ov1,ov2,ov3,ov4,ov5,ov6,ov7,ov8])
    result= aplicaPCA(o1);
    result=transpose(result);
    %%[ov1,ov1,ov1,ov1,ov1,ov1,ov1,ov1]
    % Change this to have 8 different inputs of 8 values each
   %% result = reshape(result, 8*8,1);
p = result;
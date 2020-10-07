function [p]= process_img(img_path)
    
%     angles = [0 45 90 135, 180, 225, 270, 315];
%     frequencies = [3.75];
    
    img = imread(img_path{1});
     %subplot(3,2,1),imshow(img),title('Imagen original');
    
    
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
       %o1=gaborExample2([2 4],[0 45 90 135 180 225 270 315],img,0);
      [~,o1]=gradient8(img,4,1);
      [~,o2]=gradient8(img,4,2);
      [~,o3]=gradient8(img,4,3);
      [~,o4]=gradient8(img,4,4);
      [~,o5]=gradient8(img,4,5);
      [~,o6]=gradient8(img,4,6);
      [~,o7]=gradient8(img,4,7);
      [~,o8]=gradient8(img,4,8);
      o1(o1<0)=0;
      o2(o2<0)=0;
      o3(o3<0)=0;
      o4(o4<0)=0;
      o5(o5<0)=0;
      o6(o6<0)=0;
      o7(o7<0)=0;
      o8(o8<0)=0;
      %subplot(3,2,2),imshow(o1),title('Gradiente 3 1');
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
    o1 = imgaussfilt(o1,0.5);
     o2 = imgaussfilt(o2,0.5);
      o3 = imgaussfilt(o3,0.5);
       o4 = imgaussfilt(o4,0.5);
        o5 = imgaussfilt(o5,0.5);
         o6 = imgaussfilt(o6,0.5);
          o7 = imgaussfilt(o7,0.5);
           o8 = imgaussfilt(o8,0.5);
   imshow(o2),title('kernel gaussiano');
    %%imshow(o1),title('Gradiente 48 5');
    result1= aplicaPCA(o1);
    result2= aplicaPCA(o2);
    result3= aplicaPCA(o3); 
    result4= aplicaPCA(o4);
    result5= aplicaPCA(o5);
    result6= aplicaPCA(o6);
    result7= aplicaPCA(o7);
    result8= aplicaPCA(o8);
    
%      result7=transpose(result7);
%      result4=transpose(result4);
%     result3=transpose(result3);
%     result5=transpose(result5);
%     result6=transpose(result6);
%     result8=transpose(result8);
%     result1=transpose(result1);
%     result2=transpose(result2);
    resultData=[result1;result2;result3;result4;result5;result6;result7;result8];
    %resultData = reshape(resultData, 48*8,1);
    %%[ov1,ov1,ov1,ov1,ov1,ov1,ov1,ov1]
    % Change this to have 8 different inputs of 8 values each
   %% result = reshape(result, 8*8,1);
p = resultData;
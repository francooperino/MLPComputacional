function [p]= process_img(img_path)
    
    angles = [0 45 90 135 180 225 270 315];
    frequencies = [2 4];
    
    img = imread(img_path{1});

    o1=apply_gabor(frequencies,angles,img,0);
    o2=apply_gabor(frequencies,angles,img,0);
    o3=apply_gabor(frequencies,angles,img,0);
    o4=apply_gabor(frequencies,angles,img,0);
    o5=apply_gabor(frequencies,angles,img,0);
    o6=apply_gabor(frequencies,angles,img,0);
    o7=apply_gabor(frequencies,angles,img,0);
    o8=apply_gabor(frequencies,angles,img,0);
    
    [o1,~]=gradient8(o1,8,1);
    [o2,~]=gradient8(o2,8,2);
    [o3,~]=gradient8(o3,8,3);
    [o4,~]=gradient8(o4,8,4);
    [o5,~]=gradient8(o5,8,5);
    [o6,~]=gradient8(o6,8,6);
    [o7,~]=gradient8(o7,8,7);
    [o8,~]=gradient8(o8,8,8);
    
    % Remove negative values
    o1(o1<0)=0;
    o2(o2<0)=0;
    o3(o3<0)=0;
    o4(o4<0)=0;
    o5(o5<0)=0;
    o6(o6<0)=0;
    o7(o7<0)=0;
    o8(o8<0)=0;

    % Extract result of principal component analysis
    result1= apply_pca(o1);
    result2= apply_pca(o2);
    result3= apply_pca(o3); 
    result4= apply_pca(o4);
    result5= apply_pca(o5);
    result6= apply_pca(o6);
    result7= apply_pca(o7);
    result8= apply_pca(o8);
    
    resultData=[result1;result2;result3;result4;result5;result6;result7;result8];
    
    [resultData,~]=mapminmax(resultData,-1,1);
    result = reshape(resultData, 48*8,1);
    
p = result;
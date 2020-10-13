function dataReduce = apply_pca(img)
    I = double(img);
    [coeff,~] = pca(I);
    
    reducedDimension = coeff(:,1);
    reducedData = I * reducedDimension;

    dataReduce= reducedData';
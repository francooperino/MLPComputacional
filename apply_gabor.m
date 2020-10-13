function func = apply_gabor(longitudOnda,orient,input_img,y)
    
    wavelength = longitudOnda;
    orientation = orient;
    gaborArray = gabor(wavelength,orientation);
    gaborMag = imgaborfilt(input_img,gaborArray);

    [height, width, num_filters] = size(gaborMag(:,:,:));
    combined_mag = zeros(height,width);

    % Average the values from each filter
    for i = 1:height
        for j = 1:width
            sum = 0;
            for f = 1:num_filters
                sum = sum + gaborMag(i,j,f);
            end
            combined_mag(i,j) = sum / num_filters;
        end
    end

    %% Apply gradient if needed
    switch (y)
        case 'modulo'
        [combined_mag,~] = aplicaDirGradient(combined_mag);
        case 'direccion'
        [~,combined_mag] = aplicaDirGradient(combined_mag);
        otherwise
    end


    %imshow(combined_mag,[]);
    func = combined_mag;






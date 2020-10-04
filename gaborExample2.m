function func = gaborExample2(longitudOnda,orient,image,y)
%%y puede ser 0, modulo o direccion

input_img = image;
%%Esto se descomenta si la imagen no es blanco y negro
%%input_img = rgb2gray(input_img);  

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

%%decision de aplicar gradiente

switch (y)
    case 'modulo'
    [combined_mag,Gdir] = aplicaDirGradient(combined_mag);
    case 'direccion'
    [Gmod,combined_mag] = aplicaDirGradient(combined_mag);
    otherwise
end



imshow(combined_mag,[]);
func = combined_mag;






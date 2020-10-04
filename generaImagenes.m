function generaImagenes(file,carpeta)
digitDatasetPath = fullfile(file);

imds = imageDatastore(digitDatasetPath, ...
    'IncludeSubfolders',true,...
    'LabelSource','foldernames');


j=1;

k=1;

while k<=8
   [longitudOnda,orient]=setvariables(k);
   i=1;
 while i<=100
 filename = sprintf('%s_%d',carpeta,j);    
 img = gaborExample2(longitudOnda,orient,imds.readimage(i),0);
 
 dest = strcat(filename,'.jpeg');


imwrite(uint8(img),dest);
j=j+1;
i=i+1;
 end
 k=k+1;
end
end


function [long,or]=setvariables(k)
switch k
    case 1
        longitudOnda=[2];
        orient=[0 45];        
    case 2
        longitudOnda=[2 4];
        orient=[0 45 90 135 180 225 270 315];
    case 3
        longitudOnda=[4];
        orient=[0 45 135];
    case 4
        longitudOnda=[2 4];
        orient=[0 90];
    case 5
        longitudOnda=[2 4];
        orient=[90 135 170];
    case 6
        longitudOnda=[4];
        orient=[90 135 315];
    case 7
        longitudOnda=[2 4];
        orient=[0 45 90 315];
    case 8
        longitudOnda=[2 4];
        orient=[0 45 90 135 180 225 270 315];
end
long=longitudOnda;
or=orient;
end


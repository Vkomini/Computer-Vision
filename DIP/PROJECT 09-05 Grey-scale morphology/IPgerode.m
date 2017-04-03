function [F] = IPgerode(image,nebo)
%image - image matrix as parameter
%nebo - 4 or 8

%Preparing the image
F = im2double((image));

%Get image complement
F = F - 255;
F = abs(F);

%Get dilation of image
F = IPgdilate(F,nebo);

%Reverse the image complement
F = F - 255;
F = abs(F);
return
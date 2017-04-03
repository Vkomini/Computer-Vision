function [F] = IPerode(F)
%image - image url as parameter
%Preparing the image
[M,N] = size(F);
%Get image complement
F = F - 1;
F = F.^2;
%Get Dilation of image complement
F = IPdilate(F);
%Reverse the image complement
F = F - 1;
F = F.^2;
%Show the result
imshow(F);
return
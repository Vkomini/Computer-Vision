clear all
close all
clc
%%
image=imread('lincoln.tif');
[Image_Boundary]=IPboundary(image);
%Show the result
subplot(121)
imshow(image);
title('Original image','FontSize',30);
subplot(122)
imshow(Image_Boundary);
title('Boundary of the image','FontSize',30);

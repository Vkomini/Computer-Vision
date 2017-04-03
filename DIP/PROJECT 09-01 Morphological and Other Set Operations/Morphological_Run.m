clear all
close all
clc
%%
image=imread('wirebondmask.tif');
[Dilate] = IPdilate(image);
[Erode] = IPerode(image);
%%
subplot(131)
imshow(image);
title('Original image','FontSize',30);
subplot(132)
imshow(Dilate);
title('Dilate image','FontSize',30);
subplot(133)
imshow(Erode);
title('Erode of the image','FontSize',30);

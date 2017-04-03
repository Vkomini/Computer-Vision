clear all
close all
clc
%%
image=imread('dipxetext.tif');
Mask=ones(3);
Mask=[4 2 4;2 8 2;4 2 4];
% Mask=rand(3);
[result]=IPhighboost(image,Mask,6);
%%
subplot(121),imagesc(image),colormap(gray);
title('Original Image','FontSize',20)
set(gca,'FontSize',20);
subplot(122),imagesc(result),colormap(gray);
title('Gaussian unsharping of image','FontSize',20)
set(gca,'FontSize',20);

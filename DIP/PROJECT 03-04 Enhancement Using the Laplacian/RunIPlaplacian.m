clear all
close all
clc
%%
image=imread('blurrymoon.tif');
Mask=ones(3);
Mask=[-1 -1 -1;-1 8 -1;-1 -1 -1];
% Mask=rand(3);
[result]=IPlaplacian(image,Mask,3);
imagesc(result);
%%
subplot(121),imagesc(image),colormap(gray);
title('Original Image','FontSize',20)
set(gca,'FontSize',20);
subplot(122),imagesc(result),colormap(gray);
title('Laplacian image','FontSize',20)
set(gca,'FontSize',20);

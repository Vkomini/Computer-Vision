clear all
close all
clc
%%
image=imread('circuitboard.tif');
d=0.2;
image_S_P = imnoise(image,'salt & pepper',d);
[image_S_P_Filtered]=MedianFiltering(image_S_P);
%%
figure('units','normalized','outerposition',[0 0 1 1])
subplot(131)
imagesc(image),colormap(gray)
title('Original image','FontSize',20)
set(gca,'FontSize',20);
subplot(132)
imagesc(image_S_P)
title('S&P over image','FontSize',20)
set(gca,'FontSize',20);
subplot(133)
imagesc(image_S_P_Filtered)
title('Median filtered image','FontSize',20)
set(gca,'FontSize',20);

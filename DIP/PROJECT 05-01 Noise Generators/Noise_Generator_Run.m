clear all
close all
clc
%%
image=imread('circuitboard.tif');
M=0.1;
V=0.3;
d=0.3;
image_wgn = imnoise(image,'gaussian',M,V);
image_S_P = imnoise(image,'salt & pepper',d);
%%
subplot(131)
imagesc(image),colormap(gray)
title('Original image','FontSize',20)
set(gca,'FontSize',20);
subplot(132)
imagesc(image_wgn)
title('WGN over image','FontSize',20)
set(gca,'FontSize',20);
subplot(133)
imagesc(image_S_P)
title('S&P over image','FontSize',20)
set(gca,'FontSize',20);
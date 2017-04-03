clear all
close all
clc
%%
image=imread('tiger.tif');
Mask=20*ones(3);
Mask=[1 1 1;1 2 1;1 1 1];
Mask=rand(3);
 [result]=IPfilter(image,Mask,1);
 [result1]=IPfilter(image,Mask,0);
imagesc(result);
%%
subplot(131),imagesc(image),colormap(gray);
title('Original Image','FontSize',20)
set(gca,'FontSize',20);
subplot(132),imagesc(result),colormap(gray);
title('Smoothed image','FontSize',20)
set(gca,'FontSize',20);
subplot(133),imagesc(result1),colormap(gray);
title('Unsmoothed image','FontSize',20)
set(gca,'FontSize',20);

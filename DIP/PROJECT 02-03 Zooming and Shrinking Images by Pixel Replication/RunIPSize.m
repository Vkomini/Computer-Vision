clear all
close all
clc
%%
image=imread('chronometer1250dpi.tif');
[result]=IPresize(image,0.5);
[result1]=IPresize(image,2);
imagesc(result);
%%
subplot(131),imagesc(image),colormap(gray);
title('Original Image','FontSize',20)
set(gca,'FontSize',20);
subplot(132),imagesc(result),colormap(gray);
title('Shrunken image','FontSize',20)
set(gca,'FontSize',20);
subplot(133),imagesc(result1),colormap(gray);
title('Zoomed image','FontSize',20)
set(gca,'FontSize',20);

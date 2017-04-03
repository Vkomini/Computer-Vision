clear all
close all
clc
%%
image=imread('fracturedspine.tif');
 [result1]=IPlogenhance(image,3000);
 [result]=IPpowerenhance(image,3,2);
 [result2]=IPImage_Negate(image);
%%
subplot(221),imagesc(image),colormap(gray);
title('Original Image','FontSize',20)
set(gca,'FontSize',20);
subplot(222),imagesc(result),colormap(gray);
title('Exponential enhanced','FontSize',20)
set(gca,'FontSize',20);
subplot(223),imagesc(result1),colormap(gray);
title('Log enhanced','FontSize',20)
set(gca,'FontSize',20);
subplot(224),imagesc(result2),colormap(gray);
title('Negative Image','FontSize',20)
set(gca,'FontSize',20);
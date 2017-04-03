clear all
close all
clc
%%
image=(imread('vase.tif'));
[R] = IPgdilate(image,8);
[F] = IPgerode(image,8);
%%
subplot(131),imagesc(image),colormap(gray);
title('Original Image','FontSize',20)
subplot(132),imagesc(R);
title('Dilated Image','FontSize',20)
subplot(133),imagesc(F);
title('Eroded','FontSize',20)

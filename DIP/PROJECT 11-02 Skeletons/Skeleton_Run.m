clear all 
close all
clc
%%
image=imread('nutsbolts.tif');
[ R,k] = IPskeletondecomp( 'nutsbolts.tif');
%%
[ F ] = IPskeletonrecon( image,k);
subplot(131),imagesc(image);
title('Original image','FontSize',20)
subplot(132),imagesc(R);
title('Skeleton','FontSize',20)
subplot(133),imagesc(F);
title('Reconstructed','FontSize',20)
colormap(gray)
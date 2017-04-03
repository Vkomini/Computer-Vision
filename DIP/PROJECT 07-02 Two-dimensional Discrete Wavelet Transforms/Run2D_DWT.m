clear all
close all
clc
%%
im=imread('vase.tif');
Image=double(im);
Image_Inter=InterpolatePower2(Image,1);
Scale=4;
ImageDCT=TwoD_DWT_Haar(Image_Inter,Scale);
InverseImageDCT=InverseTwoD_DWT_Haar(ImageDCT,Scale);
%%
figure('units','normalized','outerposition',[0 0 1 1])
subplot(131),imagesc(Image_Inter),colormap(gray);
title('Original image','FontSize',30)
set(gca,'FontSize',30);
subplot(132),imagesc(ImageDCT),colormap(gray);
title('2D Haar DWT','FontSize',30)
set(gca,'FontSize',30);
subplot(133),imagesc(InverseImageDCT),colormap(gray);
title('Inverse 2D Haar DWT','FontSize',30)
set(gca,'FontSize',30);
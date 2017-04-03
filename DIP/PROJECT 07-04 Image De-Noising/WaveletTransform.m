clear all
close all
clc
%%
im=imread('noisymri.tif');
Image=double(im);
Image_Inter=InterpolatePower2(Image,1);
Scale=3;
ImageDCT=TwoD_DWT_Haar(Image_Inter,Scale);
p=0.021;
[DWTImageThresholded]=ThresholdData(ImageDCT,p);
InverseImageDCT=InverseTwoD_DWT_Haar(DWTImageThresholded,Scale);
%%
figure('units','normalized','outerposition',[0 0 1 1])
subplot(221),imagesc(Image_Inter),colormap(gray),colorbar;
title('Original image','FontSize',30)
set(gca,'FontSize',30);
subplot(222),imagesc(ImageDCT),colormap(gray),colorbar;
title('2D Haar DWT','FontSize',30)
set(gca,'FontSize',30);
subplot(223),imagesc(InverseImageDCT),colormap(gray),colorbar;
title('Inverse 2D Haar DWT','FontSize',30)
set(gca,'FontSize',30);
subplot(224),imagesc(DWTImageThresholded),colormap(gray),colorbar;
title('2D Haar DWT Thresholded','FontSize',30)
set(gca,'FontSize',30);
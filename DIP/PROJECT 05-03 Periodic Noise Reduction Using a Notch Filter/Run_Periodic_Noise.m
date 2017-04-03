clear all
close all
clc
%%
image=double(imread('originalDIP.tif'));
image1=(imread('originalDIP.tif'));
Dimensions=size(image);
f=2/5;
scale=1.8/6;
u=f*Dimensions(1);
v=f*Dimensions(2);
[Image_Perdic_Noised,Noise]=Periodc_Noise(image,100,u,v);
[Data]=Notch_Filter_Gaussian(Image_Perdic_Noised,scale);
%%
figure('units','normalized','outerposition',[0 0 1 1])
subplot(221)
imagesc(image),colormap(gray)
title('Original image','FontSize',20)
set(gca,'FontSize',20);
subplot(222)
imagesc(Image_Perdic_Noised)
title('Periodic noise over image','FontSize',20)
set(gca,'FontSize',20);
subplot(223)
imagesc(Data.Image_Filtered)
title('Notch filtered image','FontSize',20)
set(gca,'FontSize',20);
subplot(224)
imagesc(Noise)
title('Noise added','FontSize',20)
set(gca,'FontSize',20);
%%
figure('units','normalized','outerposition',[0 0 1 1])
subplot(221)
imagesc(log10(abs(fftshift(fft2(image))))),colormap(gray),colorbar
title('Original image Spectrum','FontSize',20)
set(gca,'FontSize',20);
subplot(222)
imagesc(log10(abs(fftshift(fft2(Image_Perdic_Noised))))),colorbar
title('Periodic noise over image Spectrum','FontSize',20)
set(gca,'FontSize',20);
subplot(223)
imagesc(log10(abs(Data.Image_Filtered_Spectrum))),colorbar
title('Filtered image spectrum','FontSize',20)
set(gca,'FontSize',20);
subplot(224)
imagesc(Data.G),colorbar
title('2D Notch Filter','FontSize',20)
set(gca,'FontSize',20);

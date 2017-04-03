clear all
close all
clc
%%
% Direction=45;
T=3e-0;
a=10e-3;
b=a;
VarianceNoise=4e-0;
K=8e-5;
image=double(imread('originalDIP.tif'));
[Data]=BlurringImage(image,a,b,T);
Data.Image_Blurred=Data.Image_Blurred+VarianceNoise*randn(size(Data.Image_Blurred));
[Data.Image_Wiener]=Wiener_Filtering(Data.Image_Blurred,Data.H,K);
[Data.Image_Inverse_Filtering]=Wiener_Filtering(Data.Image_Blurred,Data.H,0);
%%
figure('units','normalized','outerposition',[0 0 1 1])
subplot(221)
imagesc(image),colormap(gray)
title('Original image','FontSize',20)
set(gca,'FontSize',20);
subplot(222)
imagesc(Data.Image_Blurred)
title('Image Blurred pulse WGN','FontSize',20)
set(gca,'FontSize',20);
subplot(223)
imagesc(Data.Image_Wiener)
title('Wiener Deblurred','FontSize',20)
set(gca,'FontSize',20);
subplot(224)
imagesc(Data.Image_Inverse_Filtering)
title('Inverse deconvolution Deblurred','FontSize',20)
set(gca,'FontSize',20);
%%
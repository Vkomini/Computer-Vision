clear all
close all
clc
%%
name1='characters.tif';
name2='chronometer1250dpi.tif';
Data1.image = (imread(name1));
Data1.image=abs(ifft2(fft2(Data1.image,2^12,2^12)));
Data2.image = (imread(name2));
Data2.image=abs(ifft2(fft2(Data2.image,2^12,2^12)));
[Data1.Spectrum,Data1.Phase]=FourierTransform(Data1.image);
[Data1.Image_reconstr]=InverseFourierTransform(Data1.Spectrum,Data1.Phase);
PlotInformation(Data1)
[Data2.Spectrum,Data2.Phase]=FourierTransform(Data2.image);
[Data2.Image_reconstr]=InverseFourierTransform(Data2.Spectrum,Data2.Phase);
PlotInformation(Data2)
%% Importance of phase
[Image_reconstr1]=InverseFourierTransform(Data2.Spectrum,Data1.Phase);
[Image_reconstr2]=InverseFourierTransform(Data1.Spectrum,Data2.Phase);
figure
subplot(121)
imagesc(Image_reconstr1),colormap(gray)
title('First magnitude second phase','FontSize',30)
subplot(122)
imagesc(Image_reconstr2),colorbar
title('Second magnitude first phase','FontSize',30)
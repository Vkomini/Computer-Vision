function PlotInformation(Data)
%display the average value of the Data.image accessing the central point
[x,y]=size(Data.Spectrum);
Data.Average_Value=Data.Spectrum(x/2,y/2);
%display the Data.Spectrum
Data.Spectrum = log(Data.Spectrum+1);
Data.Spectrum = mat2gray(Data.Spectrum);
%%
t.t1=sprintf('Original image\n Average value %d',Data.Average_Value);
t.t2=sprintf('Spectrum image dB');
t.t3=sprintf('Phase of the Spectrum Rad');
t.t4=sprintf('Reconstructed image');
%%
figure
subplot(221)
imagesc(Data.image),colormap(gray)
title(t.t1,'FontSize',30)
subplot(222)
imagesc(Data.Spectrum),colorbar
title(t.t2,'FontSize',30)
subplot(223)
imagesc(Data.Phase),colorbar
title(t.t3,'FontSize',30)
subplot(224)
imagesc(Data.Image_reconstr),colorbar
title(t.t4,'FontSize',30)
end
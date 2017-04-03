clear all
close all
clc
%%
image=double(imread('fracturedspine.tif'));
[Data]=HistogramEqualisation(image);
%%
subplot(221),imagesc(image),colormap(gray)
title('Original Image','FontSize',20)
set(gca,'FontSize',20);
subplot(222),bar(Data.Hist);
title('Histogram before equalization','FontSize',20)
set(gca,'FontSize',20);
subplot(223),imagesc(Data.image_hist_eq);
title('Histogram equalized image','FontSize',20)
set(gca,'FontSize',20);
subplot(224),bar(Data.Hist2);
title('Histogram after equalization','FontSize',20)
set(gca,'FontSize',20);
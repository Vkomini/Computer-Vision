clear all 
close all
clc
%%
[Image_Thresholded,Image_Double]=IPautothresh('fingerprint.tif',100,0);
%Show the result
figure(1)
subplot(122),imagesc(Image_Thresholded);
title('Thresholded image','FontSize',30);
subplot(121),imagesc(Image_Double);
title('Original image','FontSize',30);
colormap(gray)
%Show the result
figure(2)
subplot(122),hist(Image_Thresholded);
title('Thresholded image','FontSize',30);
xlabel('Pixel value','FontSize',30);
ylabel('Frequency','FontSize',30);
set(gca,'FontSize',30);
grid on
subplot(121),hist(Image_Double);
title('Original image','FontSize',30);
xlabel('Pixel value','FontSize',30);
ylabel('Frequency','FontSize',30);
set(gca,'FontSize',30);
grid on

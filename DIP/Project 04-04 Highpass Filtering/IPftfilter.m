close all
clear all
clc
%%
Manner=1;
% Prepare the image
image='characters.tif';
Cutoff_Frequency=1e1;
immagine = imread(image);
[M,N] = size(immagine);
% Padding the image
P = 2*M;
Q = 2*N;
f = zeros(P,Q);
f(1:M,1:N) = immagine;
% Performing Fourier Transform
fft = fft2(f);
% end
%%
Cutoff_Frequency_Range=10:15:80;
Total=length(Cutoff_Frequency_Range)+1;
subplot(round(sqrt(Total)),ceil((Total)/sqrt(Total)),1),imagesc(immagine),colormap(gray)
title('Original image','FontSize',20)
for i=1:length(Cutoff_Frequency_Range)
    G = IPgaussian(M,N,Cutoff_Frequency_Range(i),Manner); 
    % Performing shifting
    fourier = fftshift(fft);    
    %Performing filtering
    GF = G.*fourier;
    result = real(ifft2(ifftshift(GF)));
    % Preparing image for displaying
    result = uint8(result(1:M,1:N));
    subplot(round(sqrt(Total)),ceil((Total)/sqrt(Total)),i+1),imagesc(result),colormap(gray)
    t=sprintf('Highpass filtered image at freq %d',Cutoff_Frequency_Range(i));
    title(t,'FontSize',20)
end
%%
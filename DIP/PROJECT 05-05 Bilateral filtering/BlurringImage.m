function [Data]=BlurringImage(image,a,b,T)
%%
Dimensions=size(image);
u=1:Dimensions(1);
v=1:Dimensions(2);
[U,V]=meshgrid(u,v);
temp1=sin(pi*(a*U+b*V));
temp2=exp(1i*pi*(a*U+b*V));
temp3=T./(pi*(a*U+b*V));
H=temp1.*temp2.*temp3;
H=(fft2(abs(ifft2(H))));%% Assure the ifft2 and fft2 give are vica versa correct
image_spectrum=fftshift(fft2(image));
Spectrum_blurred=image_spectrum.*H;
Image_Blurred=abs(ifft2(Spectrum_blurred));
%%
Data.Spectrum_blurred=Spectrum_blurred;
Data.H=H;
Data.Image_Blurred=Image_Blurred;
end
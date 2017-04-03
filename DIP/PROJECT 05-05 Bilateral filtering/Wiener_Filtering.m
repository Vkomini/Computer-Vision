function [image_out]=Wiener_Filtering(Image_Degrageted,H,K)
%%
temp1=1./H;
temp2=abs(H).^2;
temp3=temp2+K;
Wiener=temp1.*temp2./temp3;
temp=fftshift(fft2(Image_Degrageted));
temp4=Wiener.*temp;
image_out=abs((ifft2(temp4)));
end
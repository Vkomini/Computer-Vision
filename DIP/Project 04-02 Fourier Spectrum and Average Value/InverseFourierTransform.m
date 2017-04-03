function [Image]=InverseFourierTransform(Magnitude,Phase)
%%
Spectrum=Magnitude.*exp(1i.*Phase);
Image=abs(ifft2(Spectrum));
end

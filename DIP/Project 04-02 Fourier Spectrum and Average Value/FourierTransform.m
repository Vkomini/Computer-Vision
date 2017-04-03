function [Amplitude,Phase]=FourierTransform(image)
%%
ComplexSpectrum=fftshift(fft2(image));
Amplitude = abs(ComplexSpectrum);
Phase = angle(ComplexSpectrum);
return

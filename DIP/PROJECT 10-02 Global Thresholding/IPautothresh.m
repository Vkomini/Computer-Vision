function [Image_Thresholded,Image_Double]=IPautothresh(image,Threshold,T0)
%% Prepare the image
img = imread(image);
[M,N] = size(img);
Image_Double=double(img);
%Calculating T
lT = 0;
disp('Thresholding the image...')
while abs(Threshold-lT)>T0
    Temporal_Bit_Classification=Image_Double>Threshold; % Find pixels higher and lower than the threshold value
    NrPixHigher=sum(Temporal_Bit_Classification(:));    % Number of pixels higher than the threshold value
    NrPixLower=M*N-NrPixHigher;                         % Number of pixels higher than the threshold value
    G1=Temporal_Bit_Classification.*Image_Double;       % Image with pixels higher than the threshold value
    G2=(~Temporal_Bit_Classification).*Image_Double;    % Image with pixels lower than the threshold value
    MeanHigher=sum(G1(:))/NrPixHigher;                  % Mean value of the pixels higher than threshold
    MeanLower=sum(G2(:))/NrPixLower;                    % Mean value of the pixels lower than threshold
    lT = Threshold;                                         
    Threshold = 1/2*(MeanHigher+MeanLower);             % Updated threshold
end
disp('Finished')
%Performing thresholding
Image_Thresholded = img>Threshold;
end
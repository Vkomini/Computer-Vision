function [DWTImageThresholded]=ThresholdData(ImageDCT,p)
%%
T1 = p*max(abs(ImageDCT(:)));
idx = abs(ImageDCT) < T1;
DWTImageThresholded=ImageDCT;
DWTImageThresholded(idx) = 0;
end

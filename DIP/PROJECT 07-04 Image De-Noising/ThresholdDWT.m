function [DWTImageThresholded]=ThresholdDWT(DWTImage,Threshold)
%%
Dimensions=size(DWTImage);
for i=1:Dimensions(1)
    for j=1:Dimensions(2)
        if DWTImage(i,j)<Threshold
            DWTImageThresholded(i,j)=0;
        else
            DWTImageThresholded(i,j)=DWTImage(i,j);
        end
    end
end
end
function [ImageDCT]=InverseTwoD_DWT_Haar(Image,Scale)
%%
Dimensions=size(Image);
for i=1:Dimensions(2)
    ImageDCT(:,i)=Inverse_DWT_Haar(Image(:,i),Scale);
end
for i=1:Dimensions(1)
    ImageDCT(i,:)=Inverse_DWT_Haar(ImageDCT(i,:),Scale);
end
end
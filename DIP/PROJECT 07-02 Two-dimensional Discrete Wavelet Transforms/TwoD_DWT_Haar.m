function [ImageDCT]=TwoD_DWT_Haar(Image,Scale)
%%
Dimensions=size(Image);
for i=1:Dimensions(1)
    ImageDCT(i,:)=DWT_Haar2D(Image(i,:),Scale);
end
for i=1:Dimensions(2)
    ImageDCT(:,i)=DWT_Haar2D(ImageDCT(:,i),Scale);
end
end
function [Image_Negative]=IPImage_Negate(Image)
%%
MaxLevel=max(Image(:));
Image_Negative=MaxLevel-1-Image;
end
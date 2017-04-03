function [b]=IPlogenhance(image,c)
%%
a=im2double(image);
b=c.*log10(1+double(a));
return
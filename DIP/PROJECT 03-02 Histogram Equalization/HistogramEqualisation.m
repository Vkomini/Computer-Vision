function [Data]=HistogramEqualisation(image)
%%
[x,y]=size(image);
image_hist_eq=zeros(x,y);
a=0:max(max(image));
Hist=histc(image(:), a);
PDF=Hist./(x*y);
CDF=cumsum(PDF);
for i=1:x
    for j=1:y
        [~,index]=min(abs(a-image(i,j)));
        image_hist_eq(i,j)=CDF(index);
    end
end
image_hist_eq=image_hist_eq*x*y;
a=0:max(image_hist_eq(:));
Hist2=histc(image_hist_eq(:), a);
%%
Data.image_hist_eq=image_hist_eq;
Data.Hist=Hist;
Data.Hist2=Hist2;
Data.CDF=CDF;
end
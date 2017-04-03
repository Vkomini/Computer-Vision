function [result]=IPresize(image,zoom)
%%
%image - Get image url from the argurement
%Zoom - Get zoom percent from the argurement, >1 is zoom, <1 is shrink
%Read the image
t=im2double(image);
[r,c,d] = size(t);
%Performing image resizing task
if(zoom>1)
    rn = floor(zoom*r);
    cn = floor(zoom*c);
    result = zeros(rn,cn,d);
    for i=1:r
        for j=1:c
            for k=i*zoom:-1:((i-1)*zoom+1)
                for l=j*zoom:-1:((j-1)*zoom+1)
                    result(k,l,:)=(t(i,j,:));
                end
            end
        end
    end
else
    rn = floor(zoom*r);
    cn = floor(zoom*c);
    result = zeros(rn,cn,d);
    zoom=round(1/zoom);
    k=1;
    for i=1:zoom:r
        l=1;
        for j=1:zoom:c
            result(k,l,:)=t(i,j,:);
            l=l+1;
        end
        k=k+1;
    end
end
return
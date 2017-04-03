function [n]=IPfilter(image,filter,smooth)
%image - Get image url from the argurement
%filter - Get filter from the argurment
%smooth - Get smoothing option, 1 is applying smooth, ~1 is not
%Padding image and replicating it
t=((image));
[r, c, d] = size(t);
m = im2double(repmat(t,3,3));
[rr,rc,rd] = size(m);
%Creating new matrix for storing
rm = zeros(rr,rc);
% Performing filter
startrow = r+1;
startcolumn = c+1;
endrow = startrow + (r-1);
endcolumn = startcolumn + (c-1);
if(smooth==1)
    avg = sum(filter(:));
    while(startrow<=endrow)
        startcolumntemp = startcolumn;
        while(startcolumntemp<=endcolumn)
            rm(startrow,startcolumntemp) =(filter(1,1)*m(startrow-1,startcolumntemp-1) +...
                filter(1,2)*m(startrow-1,startcolumntemp) + ...
                filter(1,3)*m(startrow-1,startcolumntemp+1) + ...
                filter(2,1)*m(startrow,startcolumntemp-1) + ...
                filter(2,2)*m(startrow,startcolumntemp) + ...
                filter(2,3)*m(startrow,startcolumntemp+1) + ...
                filter(3,1)*m(startrow+1,startcolumntemp-1) + ...
                filter(3,2)*m(startrow+1,startcolumntemp) + ...
                filter(3,3)*m(startrow+1,startcolumntemp+1))/avg;
            startcolumntemp = startcolumntemp +1;
        end
        startrow = startrow + 1;
    end
else
    while(startrow<=endrow)
        startcolumntemp = startcolumn;
        while(startcolumntemp<=endcolumn)
            rm(startrow,startcolumntemp) =(filter(1,1)*m(startrow-1,startcolumntemp-1) +...
                filter(1,2)*m(startrow-1,startcolumntemp) + ...
                filter(1,3)*m(startrow-1,startcolumntemp+1) + ...
                filter(2,1)*m(startrow,startcolumntemp-1) + ...
                filter(2,2)*m(startrow,startcolumntemp) + ...
                filter(2,3)*m(startrow,startcolumntemp+1) + ...
                filter(3,1)*m(startrow+1,startcolumntemp-1) + ...
                filter(3,2)*m(startrow+1,startcolumntemp) + ...
                filter(3,3)*m(startrow+1,startcolumntemp+1));
            startcolumntemp = startcolumntemp +1;
        end
        startrow = startrow + 1;
    end
end
%Drop image to original size
sr = r+1;
sc = c+1;
er = sr + (r-1);
ec = sc + (c-1);
n = im2uint8(rm(sr:er,sc:ec));
return
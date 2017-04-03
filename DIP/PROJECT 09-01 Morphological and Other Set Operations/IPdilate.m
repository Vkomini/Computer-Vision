function [F] = IPdilate(f)
%image matrix - image matrix as parameter
%Preparing the image
[M,N] = size(f);
%Padding the image
P = M + 2;
Q = N + 2;
F = zeros(P,Q);
F (2:(M+1),2:(N+1)) = f;
%Performing Dilating
for i = 2:(M+1)
    for j = 2:(N+1)
        if (F(i,j) == 1)
            if (F(i-1,j) == 0)
                F(i-1,j) = -1;
            end;
            if (F(i,j-1) == 0)
                F(i,j-1) = -1;
            end;
            if (F(i+1,j) == 0)
                F(i+1,j) = -1;
            end;
            if (F(i,j+1) == 0)
                F(i,j+1) = -1;
            end;
            if (F(i-1,j-1) == 0)
                F(i-1,j-1) = -1;
            end
            if (F(i+1,j-1) == 0)
                F(i+1,j-1) = -1;
            end
            if (F(i-1,j+1) == 0)
                F(i-1,j+1) = -1;
            end
            if (F(i+1,j+1) == 0)
                F(i+1,j+1) = -1;
            end
        end
    end
end
%Crop image to original size
F = F(2:(M+1),2:(N+1));
%Preparing the result
F = F.^2;
return
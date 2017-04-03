function [R] = IPgdilate(image,nebo)
%image - image maxtrix as parameter
%nebo - 4 or 8

%Preparing the image
f = im2double((image));
[M,N] = size(f);

%Preparing the structuring element
if(nebo == 4 )
    SE = [0 1 0;1 1 1;0 1 0];
else
    SE = [1 1 1;1 1 1;1 1 1];
end

%Preparing temp window and result matrix
W = zeros(3,3);
R = zeros(M,N);

%Padding the image
P = M + 2;
Q = N + 2;
F = zeros(P,Q);
F (2:(M+1),2:(N+1)) = f;

%Performing Dilating
for i = 2:(M+1)
    for j = 2:(N+1)
        W(1:3,1:3) = F(i-1:i+1,j-1:j+1) .* SE(1:3,1:3);
        R(i-1,j-1) = max(reshape(W,1,9));
    end
end
return
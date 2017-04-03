function [R,k] = IPskeletondecomp( f)
%img - image url as parameter

%Preparing the image
[M,N] = size(f);

%SE
SE = ones(3);


%Final result
R = zeros(M,N);

%Determine k
maxv = 1;
k = 0;
F = f;

while(maxv == 1)
    F = imerode(F,SE);
    sizem = M*N;
    maxv = max(reshape(F,1,sizem));
    if(maxv == 1)
        k = k + 1;
    end
    imshow(F)
    pause(.1)
end

F = f;

%Performing skeleton
for i = 1:k
    for j = 1:i
        F = imerode(F,SE);
    end
    Sk = F - (imdilate(imerode(F,SE),SE));
    R = IPUnion(R,Sk,M,N);
    F = f;
end
end

function [ R ] = IPUnion(R,Sk,M,N)
Sk = abs(Sk);
R = R + Sk;
for i = 1:M
   for j = 1:N
      if(R(i,j)==2)
         R(i,j) = 1; 
      end
   end
end
end
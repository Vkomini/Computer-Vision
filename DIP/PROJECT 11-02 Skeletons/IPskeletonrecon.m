function [ F ] = IPskeletonrecon( f,k)
%%
[M,N] = size(f);
%SE
SE = [1 1 1; 1 1 1; 1 1 1];
%Final result
R = zeros(M,N);
for i = 1:k    
%Perform reconstruction
    for j = 1:i
        Sk = imdilate(f,SE);
    end
    R = IPUnion(R,f,M,N);
    F = f;
end
end

function [ R ] = IPUnion(R,F,M,N)
R = R + F;
for i = 1:M
   for j = 1:N
      if(R(i,j)==2)
         R(i,j) = 1; 
      end
   end
end
end
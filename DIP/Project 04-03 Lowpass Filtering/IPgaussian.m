function [ G ] = IPgaussian(M,N,d0,o)
% M - Row size of original image
% N - Column size of original image
% d0 - Cutoff Frequency
% 0 - Filter optios : 0 for Lowpass ELSE for Highpass

% Generating Gaussian size
P = 2*M;
Q = 2*N;

% F.4.8-2 u ranges from 0 to P-1 | v ranges from 0 to Q-1
u=0:(P-1);
v=0:(Q-1);

% Generating D
D = zeros(P,Q);

StartRow = 1;
StartColumn = 1;
EndRow = P;
EndColumn = Q;

while(StartRow <= EndRow)
    StartColumn = 1;
    while(StartColumn <= EndColumn)
        D(StartRow,StartColumn) = ( (u(StartRow)-P/2)^2 + (v(StartColumn)-Q/2)^2 )^0.5;
        StartColumn = StartColumn + 1;
    end
    StartRow = StartRow + 1;
end

if(o == 0)
    G = exp(-(D.^2)./(2*(d0^2)));
else
    G=1-exp(-(D.^2)./(2*(d0^2)));
end


end


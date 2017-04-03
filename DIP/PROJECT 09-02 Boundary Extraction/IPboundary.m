function [G]=IPboundary(f)
%Performing boudary extraction
F = IPerode(f);
G = f - F;
return
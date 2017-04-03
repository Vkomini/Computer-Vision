function [SignalNew]=InterpolatePower2(Signal,scale)
%%
% if ndims(Signal)==2
Length=size(Signal);
LenghtNew(1)=scale*(2^round(log2(Length(1))));
LenghtNew(2)=scale*(2^round(log2(Length(2))));
% X_axis=1:LenghtNew(1);
% Y_axis=1:LenghtNew(2);
% [X,Y]=meshgrid(X_axis,Y_axis);
% X_axis_old=1:Length(1);
% Y_axis_old=1:Length(2);
% [X_old,Y_old]=meshgrid(X_axis_old,Y_axis_old);
% SignalNew=interp2(X_old,Y_old,Signal,X,Y);
SignalNew=abs(ifft2(fft2(Signal,LenghtNew(1),LenghtNew(2))));
% else
%     Length=length(Signal);
%     LenghtNew=scale*(2^round(log2(Length)));
%     SignalNew=abs(ifft(fft(Signal,LenghtNew)));
% end
SignalNew=squeeze(SignalNew);
end
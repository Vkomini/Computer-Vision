function [SignalNew]=InterpolatePower2(Signal,scale)
%%
% if ndims(Signal)==2
%     Length=size(Signal);
%     LenghtNew(1)=scale*(2^round(log2(Length(1))));
%     LenghtNew(2)=scale*(2^round(log2(Length(2))));
%     SignalNew=abs(ifft2(fft2(Signal,LenghtNew(1),LenghtNew(2))));
% else
Length=length(Signal);
LenghtNew=scale*(2^round(log2(Length)));
% DimenNew=1:LenghtNew;
% DimenOld=1:length(Signal);
% % SignalNew=interp1(DimenOld,Signal,DimenNew);
SignalNew=abs(ifft(fft(Signal,LenghtNew)));
% end
SignalNew=squeeze(SignalNew);
end
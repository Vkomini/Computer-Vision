function [DWT_Coef]=DWT_Haar2D(TimeSeries,Scale)
%%
J=log2(length(TimeSeries));
J=min(Scale,J);
for i=1:J-1
    [Result]=SumAndDiffer(TimeSeries);
    Temp1{i}=Result(1:end/2);
    Temp2{i}=Result(end/2+1:end);
    TimeSeries=Temp1{i};
end
[Result]=SumAndDiffer(TimeSeries);
Temp2{J}=Result;
DWT_Coef=[];
for i=1:J
    DWT_Coef=[DWT_Coef,Temp2{J-(i-1)}];
end
end
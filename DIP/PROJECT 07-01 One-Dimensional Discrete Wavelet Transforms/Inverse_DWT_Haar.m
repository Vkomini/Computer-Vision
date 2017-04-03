function [TimeSeries]=Inverse_DWT_Haar(TimeSeries)
%%
J=log2(length(TimeSeries));
for i=1:J
    Temp{i}=TimeSeries(1:2^i);
    Result=Inverse_SumAndDiffer(Temp{i});
    TimeSeries(1:2^i)=Result;
end
end
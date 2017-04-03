function [TimeSeries]=Inverse_DWT_Haar(TimeSeries,Scale)
%%
J=log2(length(TimeSeries));
Scale=min(J,Scale);
for i=J-Scale+1:J
    Temp{i}=TimeSeries(1:2^i);
    Result=Inverse_SumAndDiffer(Temp{i});
    TimeSeries(1:2^i)=Result;
end
end
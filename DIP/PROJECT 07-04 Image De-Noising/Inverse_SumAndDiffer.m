function [Inverse]=Inverse_SumAndDiffer(TimeSeries)
%%
TimeSeries=sqrt(2)*TimeSeries;
Inverse=zeros(1,length(TimeSeries));
index=1;
for i=1:length(TimeSeries)/2
    Inverse(index)=(TimeSeries(i)+TimeSeries(i+length(TimeSeries)/2))/2;
    index=index+1;
    Inverse(index)=(TimeSeries(i)-TimeSeries(i+length(TimeSeries)/2))/2;
    index=index+1;
end
end
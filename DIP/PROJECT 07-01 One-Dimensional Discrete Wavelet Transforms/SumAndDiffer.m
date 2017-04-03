function [Result]=SumAndDiffer(TimeSeries)
%%
Differ=zeros(1,length(TimeSeries)/2);
Summation=Differ;
index=1;
for i=1:2:length(TimeSeries)
    Differ(index)=TimeSeries(i)-TimeSeries(i+1);
    Summation(index)=TimeSeries(i)+TimeSeries(i+1);
    index=index+1;
end
Result=[Summation,Differ]/sqrt(2);
end
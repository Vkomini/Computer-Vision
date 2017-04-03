clear all
close all
clc
%%
TimeSeries=squeeze(rand(1,1e3));
 [TimeSeries]=InterpolatePower2(TimeSeries,2);
[DWT_Coeff]=DWT_Haar(TimeSeries);
[Inverse_DWT_Coeff]=Inverse_DWT_Haar(DWT_Coeff);
%%
figure('units','normalized','outerposition',[0 0 1 1])
subplot(311),plot(TimeSeries)
title('Original image','FontSize',30)
set(gca,'FontSize',30);
subplot(312),plot(DWT_Coeff)
title('DWT of the signal','FontSize',30)
set(gca,'FontSize',30);
subplot(313),plot(Inverse_DWT_Coeff)
title('Inverse DWT of the signal','FontSize',30)
set(gca,'FontSize',30);
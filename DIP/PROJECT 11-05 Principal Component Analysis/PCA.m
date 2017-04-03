%%
close all
clear all
clc
%%
%Load data
for i=1:6
    name=sprintf('WashingtonDC_Band%d_564.tif',i);
    D(i,:,:)=(imread(name));
    A=imread(name);
    M1(:,i)=reshape(D(i,:,:),1,min(size(A))*max(size(A)));
end
M=im2double(M1);
IMO1(:,:)=D(1,:,:);
IMO2(:,:)=D(2,:,:);
IMO3(:,:)=D(3,:,:);
IMO4(:,:)=D(4,:,:);
IMO5(:,:)=D(5,:,:);
IMO6(:,:)=D(6,:,:);
%%
figure('units','normalized','outerposition',[0 0 1 1])
subplot(231),imagesc(IMO1(:,:)),colormap(gray)
subplot(232),imagesc(IMO2(:,:)),colormap(gray)
subplot(233),imagesc(IMO3(:,:)),colormap(gray)
subplot(234),imagesc(IMO4(:,:)),colormap(gray)
subplot(235),imagesc(IMO5(:,:)),colormap(gray)
subplot(236),imagesc(IMO6(:,:)),colormap(gray)
suptitle('Original Images')
%%
%%
%Mean computation
for i=1:min(size(D))
    MeanValue(i)=mean(M(:,i));
end
MeanValue=MeanValue';
%%
%Covariance matrix computation
for i=1:min(size(D))
    for j=1:min(size(D))
        D1=(M(:,i)-MeanValue(i));
        D2=(M(:,j)-MeanValue(j));
        C(j,i)=mean(D1.*D2);
    end
end
%%
% SVD computation
[U,S,V]=svd(C);
for i=11:max(size(M))
    Ave(:,i)=MeanValue(:);
end
y=U*(M'-Ave);%Hotteling transforamtion
x=U(1:3,:)'*y(1:3,:)+Ave;%PCA reconstruction using the first 3 componenents
Diff=M'-x;
A=imread('WashingtonDC_Band1_564.tif');
%%
for i=1:6
    Im(i,:,:)=double(reshape(x(i,:),564,564));
end
for i=1:6
    ImDiff(i,:,:)=(reshape(Diff(i,:),564,564));
end
%%
IM1(:,:)=Im(1,:,:);
IM2(:,:)=Im(2,:,:);
IM3(:,:)=Im(3,:,:);
IM4(:,:)=Im(4,:,:);
IM5(:,:)=Im(5,:,:);
IM6(:,:)=Im(6,:,:);
%%
figure('units','normalized','outerposition',[0 0 1 1])
subplot(231),imagesc(IM1(:,:)),colormap(gray)
subplot(232),imagesc(IM2(:,:)),colormap(gray)
subplot(233),imagesc(IM3(:,:)),colormap(gray)
subplot(234),imagesc(IM4(:,:)),colormap(gray)
subplot(235),imagesc(IM5(:,:)),colormap(gray)
subplot(236),imagesc(IM6(:,:)),colormap(gray)
suptitle('PCA Images')
%%
IMD1(:,:)=ImDiff(1,:,:);
IMD2(:,:)=ImDiff(2,:,:);
IMD3(:,:)=ImDiff(3,:,:);
IMD4(:,:)=ImDiff(4,:,:);
IMD5(:,:)=ImDiff(5,:,:);
IMD6(:,:)=ImDiff(6,:,:);
%%
figure('units','normalized','outerposition',[0 0 1 1])
subplot(231),imagesc(IMD1(:,:)),colormap(gray)
subplot(232),imagesc(IMD2(:,:)),colormap(gray)
subplot(233),imagesc(IMD3(:,:)),colormap(gray)
subplot(234),imagesc(IMD4(:,:)),colormap(gray)
subplot(235),imagesc(IMD5(:,:)),colormap(gray)
subplot(236),imagesc(IMD6(:,:)),colormap(gray)
suptitle('Difference of the images Images')
%%
figure('units','normalized','outerposition',[0 0 1 1])
plot(S(1:6,1:6),'<','LineWidth',5)
hold on
plot(S(1:6,1:6),'x','LineWidth',5)
hold on
plot(S(1:6,1:6),'o','LineWidth',5)
xlabel('Eigen values','FontSize',30)
ylabel('Values','FontSize',30)
set(gca,'FontSize',30);
title('Eigen Values from decomposition','FontSize',30)

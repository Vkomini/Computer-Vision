%%
clear all
close all
clc
%%
Im{1}=imread('bubbles.tif');
Im{2}=imread('cktboard.tif');
Im{3}=imread('circuitboard.tif');
%%
figure('units','normalized','outerposition',[0 0 1 1])
for i=1:3
    [x{i},y{i}]=size(Im{i});
    Temp=(Im{i});
    Im{3+i}=Temp((x{i}-99:x{i}),(y{i}-99:y{i}));
    a{i}=0:max(max(Im{i}));
    Hist{i}=histc(Temp(:), a{i})';
    Probabiliti{i}=Hist{i}./sum(sum(Hist{i}));
    %%Mean
    Mean(i)=sum(sum(Probabiliti{i}.*Hist{i}));
    %%Var
    Var(i)=sum(sum(((Hist{i}-Mean(i)).^2).*Probabiliti{i}));
    %%Skew
    Skew(i)=sum(sum((Hist{i}-Mean(i)).^3.*Probabiliti{i}));
    %%Smoothness
    R(i)=ones(size(Var(i)))-(1./double(1+Var(i)));
    %%Uniformity
    Uniformity(i)=sum(sum(Probabiliti{i}.^2));
    %%Entropy
    temp1=find(Probabiliti{i});
    temp2=Probabiliti{i};
    Entropy(i)=sum(temp2(temp1(:)).*log2(temp2(temp1(:))));
    %%Ploting
    subplot(3,3,i)
    imagesc(Im{i}),colormap(gray)
    set(gca,'FontSize',20);
    subplot(3,3,(i+3))
    imshow(Im{i+3});%,colormap(gray)    
    set(gca,'FontSize',20);
    subplot(3,3,(i+6))
    hist(double(Temp))
    set(gca,'FontSize',20);
end
%%
X=['First img','Second img','Third img'];
figure('units','normalized','outerposition',[0 0 1 1])
subplot(231)
bar(Mean,'FaceColor',[0 .5 .5],'EdgeColor',[0 .9 .9],'LineWidth',1.5)
title('Mean','FontSize',20);
set(gca,'FontSize',20);
subplot(232)
bar(Var,'FaceColor',[0 .5 .5],'EdgeColor',[0 .9 .9],'LineWidth',1.5)
title('Var','FontSize',20);
set(gca,'FontSize',20);
subplot(233)
bar(Skew,'FaceColor',[0 .5 .5],'EdgeColor',[0 .9 .9],'LineWidth',1.5)
title('Skew','FontSize',20);
set(gca,'FontSize',20);
subplot(234)
bar(R,'FaceColor',[0 .5 .5],'EdgeColor',[0 .9 .9],'LineWidth',1.5)
title('Roughness','FontSize',20);
set(gca,'FontSize',20);
subplot(235)
bar(Uniformity,'FaceColor',[0 .5 .5],'EdgeColor',[0 .9 .9],'LineWidth',1.5)
title('Uniformity','FontSize',20);
set(gca,'FontSize',20);
subplot(236)
bar(Entropy,'FaceColor',[0 .5 .5],'EdgeColor',[0 .9 .9],'LineWidth',1.5)
title('Entropy','FontSize',20);
set(gca,'FontSize',20);
clear all
close all
clc
%%
img = imread('face_einstein.tif');
img=squeeze(sum(img,3));
Image=double(img);
Eye=Image(110:145,155:205);
figure,imagesc(uint8(Image)),colormap(gray)
figure,imshow(uint8(Eye));
NCC = normxcorr2(Eye, Image);
Dimensions=size(Image);
DimensionsNCC=size(NCC);
X=1:Dimensions(2);
Y=1:Dimensions(1);
XNCC=1:DimensionsNCC(2);
YNCC=1:DimensionsNCC(1);
[XNCC,YNCC]=meshgrid(XNCC,YNCC);
[x,y]=meshgrid(X,Y);
NCC=interp2(XNCC,YNCC,NCC,x,y);
figure,imagesc(uint8(NCC)),colormap(gray);



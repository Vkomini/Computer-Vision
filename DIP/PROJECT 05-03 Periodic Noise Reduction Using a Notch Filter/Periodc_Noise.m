function [Image_Perdic_Noised,Noise_Periodic]=Periodc_Noise(Image,A,u,v)
%%
Dimension=size(Image);
x=1:Dimension(1);
y=1:Dimension(2);
[X,Y]=meshgrid(x,y);
Noise_Periodic=A*sin(u*X+v*Y);
Image_Perdic_Noised=Image+Noise_Periodic;
end
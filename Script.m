clc;close all;clear;

A=imread('sourceimages/lab_1.tif');      
B=imread('sourceimages/lab_2.tif');
figure;imshow(A);figure;imshow(B);

if size(A)~=size(B)
    error('two images are not the same size.');
end

level=3;

tic;
if size(A,3)==1  %for gray images
    F=DWTDE_Fusion(A,B,level); 
else             %for color images
    F=A;
    for i=1:3
        F(:,:,i)=DWTDE_Fusion(A(:,:,i),B(:,:,i),level);
    end
end
toc;

figure;imshow(F);
imwrite(F,'results/fused_dwtde.tif');
clc;
clear all;
close all;

I = imread('lena2.tif');
I = double(I);

if ndims(I) > 2
    I = rgb2gray(I);
end

[psnr1, psnr2, I1, I2, badPixels] = DIRDHcfsFullCap(I);
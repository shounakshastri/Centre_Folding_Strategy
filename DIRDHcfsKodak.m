clc;
clear all;
close all;

imgSet = imageSet('...\Image Databases\Kodak Image Database');
no = imgSet.Count;
psnr1 = zeros(1, no);
psnr2 = zeros(1, no);
ssim1 = zeros(1, no);
ssim2 = zeros(1, no);
payload = zeros(1, no);
bpp = zeros(1, no);

%-----Data Embedding-----%
for ii = 1:no
    I = imgSet.read(ii);
    [m,n,c] = size(I);
    I1 = I;
    I2 = I;
    
    [~, ~, x11, x12, bp1]=DIRDHcfsFullCap(I(:, :, 1));
    I1(:, :, 1) = x11;
    I2(:, :, 1) = x12;
    
    [~, ~, x21, x22, bp2] = DIRDHcfsFullCap(I(:, :, 2));
    I1(:, :, 2) = x21;
    I2(:, :, 2) = x22;
    
    [~, ~, x31, x32, bp3] = DIRDHcfsFullCap(I(:, :, 3));
    I1(:, :, 3) = x31;
    I2(:, :, 3) = x32;
    
    psnr1(ii) = psnr(double(I), double(I1));
    psnr2(ii) = psnr(double(I), double(I2));
    ssim1(ii) = ssim(double(I), double(I1));
    ssim2(ii) = ssim(double(I), double(I2));
    payload(ii) = 1.5*m*n*c - (3*(bp1+bp2+bp3));
    bpp(ii) = payload(ii)/(m*n*c);
    ii
end
p=[psnr1; psnr2];
s=[ssim1; ssim2];
avg=mean(mean(p));
avgbpp=mean(bpp);
avgssim=mean(mean(s));

save kodak_cfs
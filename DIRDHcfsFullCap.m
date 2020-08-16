function [psnr1, psnr2, x1, x2, badPixels]=DIRDHcfsFullCap(x)
% function [x1,x2,badPixels]=DIRDHcfsFullCap(x)
%
% This function implements the CFS embedding scheme and gives the two stego
% images as the output along with their PSNR values and the number of
% pixels which were skipped to avoid underflow and overflow problems. This
% function embeds the data in all pixels of the cover image. 
%
% The arguments used are as follows:
%
% x: Input image
% x1 and x2: Output stego images
% badPixels: Pixels with possible underflow or overflow conditions
% psnr1 and psnr2: PSNR values of the two stego images
%
% An additional input argument 'k' can be added here as the number of bits 
% to be embedded in one go. If this is added, then the user should comment
% the line "k = 3" so that the function will take the user's k value.

x = double(x);
[m,n] = size(x);
badPixels = 0;
k = 3;
for ii = 1:m
    for jj = 1:n
        if (x(ii, jj) <= 2^(k - 1)) || (x(ii, jj) >= 255-2^(k - 1))
            badPixels = badPixels + 1;
        end
    end
end

x1 = x;
x2 = x;
for ii = 1:m
    for jj = 1:n
        if (x(ii, jj) > 2^(k - 1)) && (x(ii, jj) < 255-2^(k - 1))
            d = randi([0, 7]);
            dbar = d - 2^(k - 1);
            x1(ii, jj) = x(ii, jj) + floor(dbar/2);
            x2(ii, jj) = x(ii, jj) - ceil(dbar/2);
        end
    end
end

psnr1 = psnr(x, x1);
psnr2 = psnr(x, x2);
end

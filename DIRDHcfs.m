function [psnr1,psnr2]=DIRDHcfs(x,bpp)

% This function embeds the secret data using the centre folding strategy.
% The amount of data embedded is based on the input argument bpp and gives
% the 2 psnr values as the output. Following variables are used here:
%
% x: Input cover image
% bpp: target embedding capacity
% psnr1 and psnr2: psnrs of the two output stego images
% c: No. of bits embedded.
%
% This has been implemented for k=3. Please change the underflow/overflow
% conditions if the k value is changed.

[m,n] = size(x);
x = double(x)
x1 = x;
x2 = x;
% bpp=1.5;
c = 0;
for ii = 1:m
    for jj = 1:n
        if x(ii,jj) >= 4 && x(ii,jj) < 252                 
            db = randi([0,7]) - 4;
            x1(ii,jj) = x(ii,jj)+floor(db/2);
            x2(ii,jj) = x(ii,jj)-ceil(db/2);
            c = c + 3;
        end
        if c >= 2*bpp*m*n
            break
        end
    end
    if c >= 2*bpp*m*n
        break
    end
end

psnr1 = psnr(x1,x);
psnr2 = psnr(x2,x);
end
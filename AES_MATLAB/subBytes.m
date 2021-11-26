function [out] = subBytes_(in)
    if(in > 255)
        error("Input must be between 0 and 255 inclusive");
    elseif(in < 0)
        error("Input must be between 0 and 255 inclusive");
    end 
    gfInv = gfInverse(in);
    aff   = affineTransform(gfInv);
    out   = aff;
end

function [out] = gfInverse(num)
    if(num == 0)
        out = 0;
        return;
    end
    m = 283;
    g1 = 1;
    g2 = 0;
    d = polynomDeg(num) - 8;
    
    while(num ~= 1)
        if(d < 0)
            [num, m] = deal(m, num);
            [g1, g2] = deal(g2, g1);
            d = -d;
        end
        
        num = bitxor(num, bitshift(double(m), d));
        g1 = bitxor(g1, bitshift(g2, d));

        
        d = polynomDeg(num) - polynomDeg(m);
    end
    out = g1;
end

function [out] = affineTransform(num)
    c = [0 1 1 0 0 0 1 1];
    numBin = decimalToBinaryVector(num,8);
    numBinShift1 = circshift(numBin, -1);
    numBinShift2 = circshift(numBin, -2);
    numBinShift3 = circshift(numBin, -3);
    numBinShift4 = circshift(numBin, -4);
    out = bitxor(c, ...
          bitxor(numBinShift4, ...
          bitxor(numBinShift3, ...
          bitxor(numBinShift2, ...
          bitxor(numBin, numBinShift1)))));
    out = binaryVectorToDecimal(out);

end

function [out] = polynomDeg(num)
    deg = 0;
    num = bitshift(num, -1);
    
    while (num ~= 0)
        num = bitshift(num, -1);
        deg = deg + 1;
    end
    out = deg;
end

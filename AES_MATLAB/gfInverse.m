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
        
        num = bitxor(num, bitshift(m, d));
        g1 = bitxor(g1, bitshift(g2, d));

        
        d = polynomDeg(num) - polynomDeg(m);
    end
    out = g1;
end
function [out] = polynomDeg(num)
    deg = 0;
    num = bitshift(num, -1);
    
    while (num ~= 0)
        num = bitshift(num, -1);
        deg = deg + 1;
    end
    out = deg;
end
    
    
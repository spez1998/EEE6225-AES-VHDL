function out = invfsbytes(in)
    t = [];
    for i = 1:16
       t = [t, uint8(invSubBytes(in(i)))];
    end
    out = t;
end 
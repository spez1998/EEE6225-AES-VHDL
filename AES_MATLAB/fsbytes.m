function out = fsbytes(in)
    t = [];
    for i = 1:16
       t = [t, uint8(subBytes(in(i)))];
    end
    out = t;
end 
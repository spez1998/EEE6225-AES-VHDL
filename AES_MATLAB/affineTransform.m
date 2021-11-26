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

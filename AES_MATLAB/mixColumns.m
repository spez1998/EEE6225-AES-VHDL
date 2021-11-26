% -------------------
% Author: Rishi Patel
% -------------------
% PURPOSE: Mix columns tranform on input using matrix multiplication
% INPUT: uint32 Array input
% RETURN: uint8 Array output
function [output] = mixColumns(input)
    % Binary Px polynomial
    Px = 0b100011011;

    % Iterates matrix multiplication for 0 <= c < Nb
    for n=1:4
        % Calcuates the products for s'_(0,c)
        A=gf(2,8,Px)*gf(input(1,n),8,Px);
        B=gf(3,8,Px)*gf(input(2,n),8,Px);

        % Calcuates the products for s'_(1,c)
        C=gf(2,8,Px)*gf(input(2,n),8,Px);
        D=gf(3,8,Px)*gf(input(3,n),8,Px);

        % Calcuates the products for s'_(2,c)
        E=gf(2,8,Px)*gf(input(3,n),8,Px);
        F=gf(3,8,Px)*gf(input(4,n),8,Px);

        % Calcuates the products for s'_(3,c)
        G=gf(2,8,Px)*gf(input(4,n),8,Px);
        H=gf(3,8,Px)*gf(input(1,n),8,Px);

        % Calculates the bitwise xor operation of each element in s'_(0,c)
        output(1,n)=bitxor(bitxor(A.x,B.x),uint32(bitxor(input(3,n),input(4,n))));
        % Calculates the bitwise xor operation of each element in s'_(1,c)
        output(2,n)=bitxor(bitxor(uint32(input(1,n)),C.x),bitxor(D.x,uint32(input(4,n))));
        % Calculates the bitwise xor operation of each element in s'_(2,c)
        output(3,n)=bitxor(uint32(bitxor(input(1,n),input(2,n))),bitxor(E.x,F.x));
        % Calculates the bitwise xor operation of each element in s'_(3,c)
        output(4,n)=bitxor(bitxor(H.x,uint32(input(2,n))),bitxor(uint32(input(3,n)),G.x));
    end
    %Typecast output into uint8 array
    output = uint8(output);
end
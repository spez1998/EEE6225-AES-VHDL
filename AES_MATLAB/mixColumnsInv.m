% PURPOSE: Inverse mixColumns transform on input using matrix 
% multiplication
% INPUT: uint32 Array input
% RETURN: uint8 Array output
function [output] = mixColumnsInv(input)
    % Binary Px polynomial
    Px = 0b100011011;

    % Iterates matrix multiplication for 0 <= c < Nb
    for n=1:4
        % Calcuates each product for s'_(0,c)
        A=gf(0x0e,8,Px)*gf(input(1,n),8,Px);
        B=gf(0x0b,8,Px)*gf(input(2,n),8,Px);
        C=gf(0x0d,8,Px)*gf(input(3,n),8,Px);
        D=gf(0x09,8,Px)*gf(input(4,n),8,Px);

        % Calcuates each product for s'_(1,c)
        E=gf(0x09,8,Px)*gf(input(1,n),8,Px);
        F=gf(0x0e,8,Px)*gf(input(2,n),8,Px);
        G=gf(0x0b,8,Px)*gf(input(3,n),8,Px);
        H=gf(0x0d,8,Px)*gf(input(4,n),8,Px);

        % Calcuates each product for s'_(2,c)
        I=gf(0x0d,8,Px)*gf(input(1,n),8,Px);
        J=gf(0x09,8,Px)*gf(input(2,n),8,Px);
        K=gf(0x0e,8,Px)*gf(input(3,n),8,Px);
        L=gf(0x0b,8,Px)*gf(input(4,n),8,Px);

        % Calcuates each product for s'_(3,c)
        M=gf(0x0b,8,Px)*gf(input(1,n),8,Px);
        N=gf(0x0d,8,Px)*gf(input(2,n),8,Px);
        O=gf(0x09,8,Px)*gf(input(3,n),8,Px);
        P=gf(0x0e,8,Px)*gf(input(4,n),8,Px);

        % Calculates the bitwise xor operation of each element in s'_(0,c)
        output(1,n)=bitxor(bitxor(A.x,B.x),bitxor(C.x,D.x));
        % Calculates the bitwise xor operation of each element in s'_(1,c)
        output(2,n)=bitxor(bitxor(E.x,F.x),bitxor(G.x,H.x));
        % Calculates the bitwise xor operation of each element in s'_(2,c)
        output(3,n)=bitxor(bitxor(I.x,J.x),bitxor(K.x,L.x));
        % Calculates the bitwise xor operation of each element in s'_(3,c)
        output(4,n)=bitxor(bitxor(M.x,N.x),bitxor(O.x,P.x));
    end
    %Typecast output into uint8 array
    output = uint8(output);
end
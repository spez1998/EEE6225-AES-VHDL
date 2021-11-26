% author: Ching Tung Chung
% input: 4x4 state array
% output: 4x4 state array
% function description:
%   inverse cyclically shifts the row 
%   the first row don't shift [1 2 3 4] -> [1 2 3 4] (unchange)
%   second row shift left thrice [2 3 4 1] ->  [1 2 3 4]
%   thrid row shift left twice [3 4 1 2] -> [1 2 3 4]
%   fourth row shift left once [4 1 2 3] -> [1 2 3 4]

function OUT = InvShiftRows(IN)
    A = IN;
    % SHIFT ROW 2 TO 4
    for LINE = 2:4
        % CIRCLE SHIFT LEFT BY using
        % -2*(LINE - 5) for hex num (2 digit)
        % -8*(LINE - 5) for bin num (8 bits)
        A(LINE,:) = circshift(A(LINE,:),(LINE-5));
    end
    OUT = A;
end
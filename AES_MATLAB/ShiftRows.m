% author: Ching Tung Chung
% input: 4x4 state array
% out put: 4x4 state array
% function description:
%   cyclically shifts the row 
%   the first row don't shift [1 2 3 4] -> [1 2 3 4] (unchange)
%   second row shift left once [1 2 3 4] -> [2 3 4 1]
%   thrid row shift left twice [1 2 3 4] -> [3 4 1 2]
%   fourth row shift left thrice [1 2 3 4] -> [4 1 2 3]

function OUT = ShiftRows(IN)
    A = IN;
    % SHIFT ROW 2 TO 4
    for LINE = 2:4
        % CIRCLE SHIFT LEFT BY using 
        % -2*(LINE - 1) for hex num (2 digit)
        % -8*(LINE - 1) for bin num (8 bits)
        A(LINE,:) = circshift(A(LINE,:),-(LINE-1));
    end
    OUT = A;
end


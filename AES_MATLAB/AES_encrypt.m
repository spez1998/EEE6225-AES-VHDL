% Working proof of concept of AES, low area implimentation. 
% Author:   Jowi Szetu, Sujit Malde, Ching Tung Chung, Charley Rattue and 
%               Rishi Patel. 
% Tasks:    Integration - Jowi Szetu
%           sByte       - Sujit Malde
%           MixedColumn - Rishi Patel
%           ShiftRows   - Ching Tung Chung
%           KeyExpansion- Charley Rattue

function [hexStrOut, hexStrOutSpaced] = AES(keyString, inputString, enable) 
    % Description:  Integrate all parts of the AES. Performs both 
    %                   enrcyption and decrpytion of the input string
    % inputs:       keyString -> Hex string, inputString -> Hex String,           
    %                   enable -> boolean
    % output:       output -> Hex string

    warning('off');
    %take the 128-bit hex input string and convert it into a 4x4 uint8 matrix  
    input = hexStr2uint8M(inputString);

    %Generate all the keys need to perform the AES
    %key expansion - Charley Rattue/ Jowi Szetu
    keys = keyExpansion(keyString);

    % The if statement on enable to decide to encrypt or decrypt
    % enable 1/0 -> Encrypt/Decrypt
    if (enable)
        %Add round key
        temp = bitxor(keys(1, 1:16), input(1:16));
        %fprintf('round[01].addround() -> %d', temp(1:16));
        for round = 2:10
            %Algorithmic sub byte - Sujit Malde
            temp = fsbytes(temp);
            %shift rows - Ching Tung Chung
            temp = ShiftRows(reshape(temp, 4, 4));
            %mix columns - Rishi Patel
            temp = mixColumns(temp);
            temp = bitxor(keys(round, 1:16), temp(1:16));
        end 
        temp = fsbytes(temp);
        temp = ShiftRows(reshape(temp, 4, 4));
        temp = bitxor(keys(round+1, 1:16), temp(1:16));
    else 
        % This bit is for the decryption
        % add round key
        temp = bitxor(keys(11, 1:16), input(1:16));
        %inverse shift rows
        temp = InvShiftRows(reshape(temp, 4, 4));        
        %inverse sub bytes
        temp = invfsbytes(temp);      
        
        %for loop 10:2 decrementing
        for round = 10:-1:2
            %add round key
            temp = bitxor(keys(round, 1:16), temp(1:16));
            %inverse mixed columns
            temp = mixColumnsInv(reshape(temp, 4, 4));            
            %inverse shift rows
            temp = InvShiftRows(reshape(temp, 4, 4));
            %inverse sub bytes
            temp = invfsbytes(temp);              
        end
        %final round outside of loop  
        %add round key
        temp = bitxor(keys(1, 1:16), temp(1:16));
    end
    t1 = ''; t2 = '';
    for i = 1:16
        t1 = cat(2, t1, dec2hex(temp(i), 2), ' ');
        t2 = cat(2, t2, dec2hex(temp(i), 2));
    end 

    hexStrOutSpaced = t1(1:end -1);
    hexStrOut = t2;
end

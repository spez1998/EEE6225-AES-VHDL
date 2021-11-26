function roundKeys = keyExpansion(H)
    %This function takes in the input H and uses it to generate
    %10 new round keys and outputs them as a 10x1x16 uint8 matrix
    %input:     H           - 128-bit hex string
    %output:    roundkeys   - 11x1x16 uint8 matrix

    %take the 128-bit hex string and convert it into a 4x4 uint8 matrix 
    key = hexStr2uint8M(H);
    keys = [key(1:16)];
    for round = 1:10
        keys = cat(1, keys, generateKey(reshape(keys(round,:), 4,4), round));
    end 
    roundKeys = keys;
end 

function newKey = generateKey(currentKey, currentRound)
    %This function generates a new key based on the current key and the
    %current round
    %inputs: currentKey - 4x4 uint8 matrix, currentRound - uint8 numeric
    %output: newKey     - 1x16 uint8 matrix
    %Author: Charley Rattue/ Jowi Szetu

    %Take the current key 
    w0 = currentKey(1:4);
    w1 = currentKey(5:8); 
    w2 = currentKey(9:12);
    w3 = currentKey(13:16);

    %Calculate a new word g using the fourth word 'w3' and the current
    %round
    g = gfunc(w3, currentRound);

    %Performs the bitxor functions to generate the new key
    w4 = bitxor(g, w0); 
    w5 = bitxor(w4, w1); 
    w6 = bitxor(w5, w2); 
    w7 = bitxor(w6, w3); 

    newKey = [w4,w5,w6,w7];

end

function g = gfunc(word, currentRound) 
    %This function calculates the value of g
    %inputs: word - 1x4 uint8 row vector, currentRound - uint8 numeric
    %output: g - 1x4 uint8 row vector
    %Author: Charley Rattue/ Jowi Szetu

    %This array hold the round join constants that are dependent on which
    %round it is.
    rjc = [uint8(1), uint8(2), uint8(4), uint8(8), uint8(16),...
            uint8(32), uint8(64), uint8(128), uint8(27), uint8(54),];

    %holds the full value of rjc for a particular round as 1x4 uint8 row
    %vector
    rjcFull = [rjc(currentRound), uint8(0), uint8(0), uint8(0)];

    %splits the word into 4 uint8 numerics and performs a left shift by byte
    b3 = word(1); b0 = word(2); b1 = word(3); b2 = word(4);

    %Performs the subBytes for each byte
    b4 = uint8(subBytes(b0));
    b5 = uint8(subBytes(b1));
    b6 = uint8(subBytes(b2));
    b7 = uint8(subBytes(b3));

    %final xor to calculate g
    g = bitxor([b4, b5, b6, b7], rjcFull);
end

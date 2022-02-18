xIn  = [1,0,1,1]
xOut = []

xOut.append(xIn[0] ^ (xIn[0]&xIn[1]&xIn[2]) ^ (xIn[0]&xIn[3]) ^ xIn[1])
xOut.append((xIn[0]&xIn[1]&xIn[2]) ^ (xIn[0]&xIn[1]&xIn[3]) ^ (xIn[0]&xIn[3]) ^ xIn[1] ^ (xIn[1]&xIn[2]))
xOut.append(xIn[0] ^ (xIn[0]&xIn[1]&xIn[2]) ^ (xIn[0]&xIn[2]&xIn[3]) ^ xIn[1] ^ (xIn[1]&xIn[3]) ^ xIn[2])
xOut.append((xIn[0]&xIn[1]&xIn[2]) ^ (xIn[0]&xIn[1]&xIn[3]) ^ (xIn[0]&xIn[2]) ^ (xIn[0]&xIn[2]&xIn[3]) ^ (xIn[0]&xIn[3]) ^ \
          xIn[1] ^ (xIn[1]&xIn[2]) ^ (xIn[1]&xIn[2]&xIn[3]) ^ xIn[2] ^ xIn[3])

print(f"{xIn} inverse in GF(2) = {xOut}")
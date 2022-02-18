#include <fstream>
#include <iostream>
#include <stdint.h>
#include <string>
#include <tuple>
#include <vector>

#include "sbox.h"

int checker(int lineCount, int resultByte, uint8_t *gold)
{
    if (resultByte != gold[lineCount%256]) {
        if(resultByte < 256)
            std::cout<<"Encode error! ";
        else
            std::cout<<"Decode error! ";
        std::cout<<"Expected: "<<gold[lineCount]<< " but got: "<<resultByte<<std::endl;
    }
}

int main()
{
    std::ifstream infile("results.txt");
    std::string resultStr;
    int lineCount = 0;
    std::vector<std::tuple<int, int>> errors;
    while(std::getline(infile, resultStr)) {
        uint8_t resultByte = std::stoi(resultStr, nullptr, 2);
        if (lineCount < 256)
            checker(lineCount, resultByte, sbox);
        else
            checker(lineCount, resultByte, invSbox);
        lineCount++;
    }
    infile.close();
    return 0;
}
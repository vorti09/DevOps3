#include <iostream>
#include <cassert>
#include <cmath>
#include <chrono>
#include "FuncA.h"

void testFuncAPerformance() {
    FuncA func;

    // Тест продуктивності
    double x = 10000.0;
    long int n = 9000000000;

    auto start = std::chrono::high_resolution_clock::now();
    func.calculate(x, n);
    auto end = std::chrono::high_resolution_clock::now();

    std::chrono::duration<double> elapsed = end - start;
    double timeTaken = elapsed.count();
    assert(timeTaken >= 5.0 && timeTaken <= 20.0);
    std::cout << "Performance test passed! Time: " << timeTaken << " seconds." << std::endl;
}

int main() {
    testFuncAPerformance();
    std::cout << "Done." << std::endl;
    return 0;
}

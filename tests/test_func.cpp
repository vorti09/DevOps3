#include <iostream>
#include <cassert>
#include <cmath> // для використання abs()
#include "FuncA.h"

void testFuncA() {
    FuncA func;

    // Тест 1: перевірка для x = 1.0 (очікується, що значення буде наближене до sinh(1.0))
    double result = func.calculate(1.0, 5);
    double expected = std::sinh(1.0);
    assert(abs(result - expected) < 0.0001);

    std::cout << "Done." << std::endl;
}

int main() {
    testFuncA();
    return 0;
}

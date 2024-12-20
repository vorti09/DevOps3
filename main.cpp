#include <iostream>
#include "FuncA.h"

int CreateHTTPserver();

int main() {
    FuncA func;
    double result = func.calculate(1.0, 5); // Приклад аргументу
    std::cout << "Result: " << result << std::endl;
    CreateHTTPserver();
    return 0;
}

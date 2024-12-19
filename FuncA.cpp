#include <iostream> 
#include "FuncA.h"
#include <cmath>

/**
 * @brief Обчислює гіперболічний синус через суму перших n елементів ряду.
 * @param x Аргумент функції.
 * @param n Кількість елементів ряду, які будуть використані.
 * @return Значення гіперболічного синуса.
 */
double FuncA::calculate(double x, int n) {
    double result = 0.0;
    for (int i = 0; i < n; ++i) {
        double term = std::pow(x, 2 * i + 1) / std::tgamma(2 * i + 2); // Розклад ряду
        result += term;
    }
    return result;
}

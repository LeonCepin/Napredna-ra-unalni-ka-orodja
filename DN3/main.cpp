#include <iostream>
#include <cmath>

double arctan(double x, int n) {
    double rezultat = 0.0;
    for (int i = 0; i <= n; ++i) {
        double term = std::pow(-1, i) * std::pow(x, 2 * i + 1) / (2 * i + 1);
        rezultat += term;
    }
    return rezultat;
}

double trapeznaMetoda(double a, double b, int n) {
    double h = (b - a) / n;
    double integral = 0.0;

    for (int i = 0; i <= n; ++i) {
        double x = a + i * h;
        double f_x = std::exp(3 * x) * arctan(x / 2, 10);
        if (i == 0 || i == n) {
            integral += f_x;
        } else {
            integral += 2 * f_x;
        }
    }

    integral *= (b - a) / (2 * n);
    return integral;
}

int main() {
    double a = 0.0;
    double b = M_PI / 4.0;
    int n = 1000;

    double result = trapeznaMetoda(a, b, n);

    std::cout << "Aproksimirana vrednost integrala: " << result << std::endl;

    return 0;
}

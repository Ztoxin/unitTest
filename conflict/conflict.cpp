#include <iostream>

void call_f2(){
    double a[10];
    std::cout << "f2: " << &a[0] << "\n";
    std::cout << "f2: " << &a[1] << "\n";
    std::cout << "f2: " << &a[2] << "\n";
    std::cout << "f2: " << &a[3] << "\n";
    std::cout << "f2: " << &a[4] << "\n";
    std::cout << "f2: " << &a[5] << "\n";
    std::cout << "f2: " << &a[6] << "\n";
    std::cout << "f2: " << &a[7] << "\n";
    std::cout << "f2: " << &a[8] << "\n";
    std::cout << "f2: " << &a[9] << "\n";
}

void call_f1(){
    double a[5];
    std::cout << "f1: " << &a[0] << "\n";
    std::cout << "f1: " << &a[1] << "\n";
    std::cout << "f1: " << &a[2] << "\n";
    std::cout << "f1: " << &a[3] << "\n";
    std::cout << "f1: " << &a[4] << "\n";
}

int main(){
    call_f1();
    call_f2();
    return 0;
}
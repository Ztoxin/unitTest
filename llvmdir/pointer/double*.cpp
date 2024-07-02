#include <iostream>

void foo(double* a){

}

void foo2(double a){

}

void foo3(double[10]){

}

void foo4(double* temp){

}

int main(){
    double* a = (double*)malloc(sizeof(double) * 10);
    double* b = (double*)malloc(sizeof(double) * 10);
    double* c = (double*)malloc(sizeof(double) * 10);
    double* temp;
    foo(a);
    for(int i = 0; i < 10; i++){
        c[i] = a[i] + b[i];
    }
    double** d = (double**)malloc(sizeof(double*)* 10);
    double aa[10];
    for(int i = 0; i < 10; i++){
        c[i] += aa[i] + b[i];
    }
    temp = c;
    foo(aa);
    
    foo2(*a);
    foo3(aa);

    double var;
    foo4(&var);
    return 0;
}
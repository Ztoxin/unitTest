clang $DEFINE_FLAG -emit-llvm -c double\*.cpp -S -Xclang -disable-O0-optnone -fno-math-errno  -std=c++17
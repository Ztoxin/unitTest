查表优化的主要精髓，主要是把数组的首地址和行号建立映射，下面介绍两种得到数组首地址的方法：

1. double* a = (double*)malloc(sizeof(double) * n);类型

   a[1] = 0;

   这种a[1] = 0，IR上表示是%10 = load double*，double** %2,  align 4（这是得到数组的首地址，返回的是double\*类型）

   得到第二个元素就是%11 = getelementptr inbounds double, double* %10, i64 1。用gep得到偏移

   所以说在%10 = load double*，double** %2,  align 4这一步应该建立首地址和EPM行列的映射，也就是建立%10和EPM行列的映射。

   **和微分的联系是**：因为微分一般对数组元素做微分，根据代码可知，微分是要用到valueToPtr得到数组元素的地址，valueToPtr是在load的时候建立load和数组元素地址的映射，假设是%20 = load double, double*%11, align 8(这个%11用的是上面例子中的)，那么valueToPtr中就应该是，%20到%11的映射，那么传给getColIdByPtr函数就应该是%11，由于%11是gep指令所以在__getColIdByPtr函数中会进行递归，直到递归到%10 = load double*，double** %2,  align 4，发现有%10到EPM行列的映射，则得到数组首地址的EPM行号。

2. a[10]类型

   a[1] = 0

   这种在IR的表示是%48 = getelementptr inbounds [10 x double], [10 x double]* %8, i64 0, i64 1，这是得到指向a[1]的指针，得到a[1]的元素还要%49 = load double, double *%48, align 8, 这才是a[1]的值，所以valueToPtr中保存的是，%49到%48的映射，而如果我们用这个函数SAESP_getEpmRowIdx得到数组的行号时，是将数组的首地址给放入了函数中，这种的和double\*的不同是，得到数组元素首地址是%67 = getelementptr inbounds [10 x double], [10 x double]* %8, i64 0, i64 0，也就是数组的偏移是0，就代表首地址。所以我们如果想要建立数组首地址到EPM行列的映射按正常思维是应该建立%67到EPM行的映射。（**其实这个正常思维是不对的，下面我会在和微分关系的联系中来说明**）

   **和微分的关系是：**继续上面的案例，valueToPtr中保存的是，%49到%48的映射，然后在建立微分节点的时候会通过valueToPtr找到Ptr（%48），然后在生成微分代码的时候，会将%48传给getColIdByPtr函数，然后会调用__getColIdByPtr函数中会进行递归，直到递归到%8 = alloc [10 * double],align 8;但是你会发现，这是在数组首地址对应的EPM行列映射中找不到的，那建立映射就没用了呀。**所以说上面的正常思维是错的**，**不应该建立数组首地址和EPM行的映射，而是应该建立，alloc指令和EPM行列的映射**，这样在__getColIdByPtr函数中就能找到该数组对应的EPM行号，然后再通过gep的偏移来算出真正的EPM行号。

   其实就不应该有这个正常思维，因为如果是gep，要是想得到首地址，就一定要有0的偏移，而得到数组元素就是其他偏移，他们两个指令唯一的共同点就是指针操作数都是alloc [10 * double]，align 8

**对double *a = (double\*)malloc(sizeof(double) * 10)和double a[10]两种方法得到数组首地址的总结**

1. double *a = (double\*)malloc(sizeof(double) * 10)

   这种的会通过%2 = alloc double*, align 8,来开辟一个double\*类型的指针，这其实就是开辟了double\*的空间，存放double\*的指针，然后%2是指向这个double\*指针的二维指针类型double**，所以这个double\*就是存放的数组的首地址，每次想得到数组的首地址要进行从二维指针中load出来，如果想得到数组的元素就要再用gep进行偏移后的指针

2. double a[10]

   这种的通过%3 = alloc [10 * double]，来分配一个指向[10 * double]的一维指针，**但是这个却不是首地址，**如果想得到首地址就要用gep指令然后偏移0， 想得到其他元素就要加其他的偏移量

   **解释上面的不是首地址的问题**，主要是%3是[10 * double]*类型，而函数的参数是double\*类型

   下面是gpt的回答
```cpp
// 第一个问题
%8 = alloca [10 x double], align 16，这个%8是不是指向数组的首地址？

ChatGPT
是的，在LLVM IR中，alloca [10 x double], align 16指令分配了一个包含10个double元素的数组。结果寄存器%8将是一个指向数组首地址的指针。

解释
%8 = alloca [10 x double], align 16
%8 是分配的内存地址。
alloca [10 x double] 分配了一个包含10个double元素的数组。
align 16 指定内存对齐为16字节。
%8的类型是[10 x double]*，即指向10个double元素的数组的指针。

获取首地址
在LLVM IR中，直接使用%8就可以获得数组的首地址。要访问数组中的元素，你需要使用getelementptr指令。

总结
alloca [10 x double], align 16 分配了一个包含10个double元素的数组，%8是指向该数组首地址的指针。
你可以使用 allocaInst->getAllocatedType() 获取分配的类型，并通过 isArrayTy() 方法检查是否是数组类型。
getelementptr 指令可以用于访问数组中的元素。




// 第二个问题
那为什么将数组的首地址放入函数中却要经历一个gep指针，偏移是0的操作????

ChatGPT
在LLVM中，尽管alloca指令直接返回一个指向数组的指针，但当你想将该指针作为函数参数传递时，通常使用getelementptr指令来生成一个指向数组首元素的指针。这样做可以确保类型和对齐要求都正确。

假设我们有一个函数foo，它接受一个指向double类型的指针：

declare void @foo(double*)
我们要将alloca分配的数组首地址传递给这个函数：

%8 = alloca [10 x double], align 16
直接传递%8是不正确的，因为%8的类型是[10 x double]*，而函数期望的参数类型是double*。因此，我们需要使用getelementptr指令获取数组的首元素的指针，该指令的偏移量为0：

%9 = getelementptr inbounds [10 x double], [10 x double]* %8, i32 0, i32 0
call void @foo(double* %9)
解释getelementptr指令
%9 = getelementptr inbounds [10 x double], [10 x double]* %8, i32 0, i32 0
getelementptr inbounds [10 x double], [10 x double]* %8, i32 0, i32 0
[10 x double] 表示基类型是包含10个double元素的数组。
[10 x double]* %8 是基指针，指向这个数组。
i32 0 是第一个偏移量，表示数组的第0个元素。
i32 0 是第二个偏移量，表示数组第0个元素中的第0个double元素。
这样，%9的类型是double*，表示数组的首元素的指针，可以正确地作为参数传递给foo函数。

总结
alloca指令分配的数组指针类型为[10 x double]*，需要转换为double*类型才能作为参数传递给函数。
使用getelementptr指令进行类型转换，以确保类型和对齐要求都正确。
偏移量为0的getelementptr指令获取数组首元素的指针。
fpext指令是将一个较低精度的浮点数扩展为较高精度的浮点数
fptrunc指令是将一个较高精度的浮点数截断成一个较低精度的浮点数

这个我认为只需要建立再建立一个截断指令到load指令的映射就可以了，在创建微分树的节点的时候通过映射找到截断指令对应的load指令，然后再通过load指令找到对应的地址就可以。因为微分树最主要的就是地址。截断指令就是二元指令的操作数，如%10 = %9 + %8，%9和%8一定是相同的精度。
当然store指令也要建立截断指令和load指令的映射。
%11 = load float, float* %3, align 4
%12 = fpext float %11 to double
%13 = fadd double %10, %12
%14 = fptrunc double %13 to float
store float %14, float* %5, align 4

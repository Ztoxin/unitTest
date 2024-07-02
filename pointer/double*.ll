; ModuleID = 'double*.cpp'
source_filename = "double*.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"class.std::ios_base::Init" = type { i8 }

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1
@__dso_handle = external hidden global i8
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_double_.cpp, i8* null }]

; Function Attrs: noinline uwtable
define internal void @__cxx_global_var_init() #0 section ".text.startup" {
  call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* nonnull align 1 dereferenceable(1) @_ZStL8__ioinit)
  %1 = call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i32 0, i32 0), i8* @__dso_handle) #3
  ret void
}

declare dso_local void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* nonnull align 1 dereferenceable(1)) unnamed_addr #1

; Function Attrs: nounwind
declare dso_local void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"* nonnull align 1 dereferenceable(1)) unnamed_addr #2

; Function Attrs: nounwind
declare dso_local i32 @__cxa_atexit(void (i8*)*, i8*, i8*) #3

; Function Attrs: mustprogress noinline nounwind uwtable
define dso_local void @_Z3fooPd(double* %0) #4 {
  %2 = alloca double*, align 8
  store double* %0, double** %2, align 8
  ret void
}

; Function Attrs: mustprogress noinline nounwind uwtable
define dso_local void @_Z4foo2d(double %0) #4 {
  %2 = alloca double, align 8
  store double %0, double* %2, align 8
  ret void
}

; Function Attrs: mustprogress noinline nounwind uwtable
define dso_local void @_Z4foo3Pd(double* %0) #4 {
  %2 = alloca double*, align 8
  store double* %0, double** %2, align 8
  ret void
}

; Function Attrs: mustprogress noinline nounwind uwtable
define dso_local void @_Z4foo4Pd(double* %0) #4 {
  %2 = alloca double*, align 8
  store double* %0, double** %2, align 8
  ret void
}

; Function Attrs: mustprogress noinline norecurse nounwind uwtable
define dso_local i32 @main() #5 {
  %1 = alloca i32, align 4
  %2 = alloca double*, align 8
  %3 = alloca double*, align 8
  %4 = alloca double*, align 8
  %5 = alloca double*, align 8
  %6 = alloca i32, align 4
  %7 = alloca double**, align 8
  %8 = alloca [10 x double], align 16
  %9 = alloca i32, align 4
  %10 = alloca double, align 8
  store i32 0, i32* %1, align 4
  %11 = call noalias align 16 i8* @malloc(i64 80) #3
  %12 = bitcast i8* %11 to double*
  store double* %12, double** %2, align 8
  %13 = call noalias align 16 i8* @malloc(i64 80) #3
  %14 = bitcast i8* %13 to double*
  store double* %14, double** %3, align 8
  %15 = call noalias align 16 i8* @malloc(i64 80) #3
  %16 = bitcast i8* %15 to double*
  store double* %16, double** %4, align 8
  %17 = load double*, double** %2, align 8
  call void @_Z3fooPd(double* %17)
  store i32 0, i32* %6, align 4
  br label %18

18:                                               ; preds = %37, %0
  %19 = load i32, i32* %6, align 4
  %20 = icmp slt i32 %19, 10
  br i1 %20, label %21, label %40

21:                                               ; preds = %18
  %22 = load double*, double** %2, align 8
  %23 = load i32, i32* %6, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds double, double* %22, i64 %24
  %26 = load double, double* %25, align 8
  %27 = load double*, double** %3, align 8
  %28 = load i32, i32* %6, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds double, double* %27, i64 %29
  %31 = load double, double* %30, align 8
  %32 = fadd double %26, %31
  %33 = load double*, double** %4, align 8
  %34 = load i32, i32* %6, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds double, double* %33, i64 %35
  store double %32, double* %36, align 8
  br label %37

37:                                               ; preds = %21
  %38 = load i32, i32* %6, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, i32* %6, align 4
  br label %18, !llvm.loop !4

40:                                               ; preds = %18
  %41 = call noalias align 16 i8* @malloc(i64 80) #3
  %42 = bitcast i8* %41 to double**
  store double** %42, double*** %7, align 8
  store i32 0, i32* %9, align 4
  br label %43

43:                                               ; preds = %63, %40
  %44 = load i32, i32* %9, align 4
  %45 = icmp slt i32 %44, 10
  br i1 %45, label %46, label %66

46:                                               ; preds = %43
  %47 = load i32, i32* %9, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [10 x double], [10 x double]* %8, i64 0, i64 %48
  %50 = load double, double* %49, align 8
  %51 = load double*, double** %3, align 8
  %52 = load i32, i32* %9, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds double, double* %51, i64 %53
  %55 = load double, double* %54, align 8
  %56 = fadd double %50, %55
  %57 = load double*, double** %4, align 8
  %58 = load i32, i32* %9, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds double, double* %57, i64 %59
  %61 = load double, double* %60, align 8
  %62 = fadd double %61, %56
  store double %62, double* %60, align 8
  br label %63

63:                                               ; preds = %46
  %64 = load i32, i32* %9, align 4
  %65 = add nsw i32 %64, 1
  store i32 %65, i32* %9, align 4
  br label %43, !llvm.loop !6

66:                                               ; preds = %43
  %67 = load double*, double** %4, align 8
  store double* %67, double** %5, align 8
  %68 = getelementptr inbounds [10 x double], [10 x double]* %8, i64 0, i64 0
  call void @_Z3fooPd(double* %68)
  %69 = load double*, double** %2, align 8
  %70 = load double, double* %69, align 8
  call void @_Z4foo2d(double %70)
  %71 = getelementptr inbounds [10 x double], [10 x double]* %8, i64 0, i64 0
  call void @_Z4foo3Pd(double* %71)
  call void @_Z4foo4Pd(double* %10)
  ret i32 0
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noinline uwtable
define internal void @_GLOBAL__sub_I_double_.cpp() #0 section ".text.startup" {
  call void @__cxx_global_var_init()
  ret void
}

attributes #0 = { noinline uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }
attributes #4 = { mustprogress noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress noinline norecurse nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"uwtable", i32 1}
!2 = !{i32 7, !"frame-pointer", i32 2}
!3 = !{!"clang version 13.0.0"}
!4 = distinct !{!4, !5}
!5 = !{!"llvm.loop.mustprogress"}
!6 = distinct !{!6, !5}


hello:	file format elf64-x86-64

Disassembly of section .init:

0000000000401000 <_init>:
  401000: f3 0f 1e fa                  	endbr64
  401004: 48 83 ec 08                  	subq	$8, %rsp
  401008: 48 8b 05 e9 2f 00 00         	movq	12265(%rip), %rax       # 0x403ff8 <printf@GLIBC_2.2.5+0x403ff8>
  40100f: 48 85 c0                     	testq	%rax, %rax
  401012: 74 02                        	je	0x401016 <_init+0x16>
  401014: ff d0                        	callq	*%rax
  401016: 48 83 c4 08                  	addq	$8, %rsp
  40101a: c3                           	retq

Disassembly of section .plt:

0000000000401020 <.plt>:
  401020: ff 35 e2 2f 00 00            	pushq	12258(%rip)             # 0x404008 <_GLOBAL_OFFSET_TABLE_+0x8>
  401026: ff 25 e4 2f 00 00            	jmpq	*12260(%rip)            # 0x404010 <_GLOBAL_OFFSET_TABLE_+0x10>
  40102c: 0f 1f 40 00                  	nopl	(%rax)

0000000000401030 <printf@plt>:
  401030: ff 25 e2 2f 00 00            	jmpq	*12258(%rip)            # 0x404018 <_GLOBAL_OFFSET_TABLE_+0x18>
  401036: 68 00 00 00 00               	pushq	$0
  40103b: e9 e0 ff ff ff               	jmp	0x401020 <.plt>

Disassembly of section .text:

0000000000401040 <_start>:
  401040: f3 0f 1e fa                  	endbr64
  401044: 31 ed                        	xorl	%ebp, %ebp
  401046: 49 89 d1                     	movq	%rdx, %r9
  401049: 5e                           	popq	%rsi
  40104a: 48 89 e2                     	movq	%rsp, %rdx
  40104d: 48 83 e4 f0                  	andq	$-16, %rsp
  401051: 50                           	pushq	%rax
  401052: 54                           	pushq	%rsp
  401053: 45 31 c0                     	xorl	%r8d, %r8d
  401056: 31 c9                        	xorl	%ecx, %ecx
  401058: 48 c7 c7 30 11 40 00         	movq	$4198704, %rdi          # imm = 0x401130
  40105f: ff 15 8b 2f 00 00            	callq	*12171(%rip)            # 0x403ff0 <printf@GLIBC_2.2.5+0x403ff0>
  401065: f4                           	hlt
  401066: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

0000000000401070 <_dl_relocate_static_pie>:
  401070: f3 0f 1e fa                  	endbr64
  401074: c3                           	retq
  401075: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  40107f: 90                           	nop

0000000000401080 <deregister_tm_clones>:
  401080: b8 30 40 40 00               	movl	$4210736, %eax          # imm = 0x404030
  401085: 48 3d 30 40 40 00            	cmpq	$4210736, %rax          # imm = 0x404030
  40108b: 74 13                        	je	0x4010a0 <deregister_tm_clones+0x20>
  40108d: b8 00 00 00 00               	movl	$0, %eax
  401092: 48 85 c0                     	testq	%rax, %rax
  401095: 74 09                        	je	0x4010a0 <deregister_tm_clones+0x20>
  401097: bf 30 40 40 00               	movl	$4210736, %edi          # imm = 0x404030
  40109c: ff e0                        	jmpq	*%rax
  40109e: 66 90                        	nop
  4010a0: c3                           	retq
  4010a1: 66 66 2e 0f 1f 84 00 00 00 00 00     	nopw	%cs:(%rax,%rax)
  4010ac: 0f 1f 40 00                  	nopl	(%rax)

00000000004010b0 <register_tm_clones>:
  4010b0: be 30 40 40 00               	movl	$4210736, %esi          # imm = 0x404030
  4010b5: 48 81 ee 30 40 40 00         	subq	$4210736, %rsi          # imm = 0x404030
  4010bc: 48 89 f0                     	movq	%rsi, %rax
  4010bf: 48 c1 ee 3f                  	shrq	$63, %rsi
  4010c3: 48 c1 f8 03                  	sarq	$3, %rax
  4010c7: 48 01 c6                     	addq	%rax, %rsi
  4010ca: 48 d1 fe                     	sarq	%rsi
  4010cd: 74 11                        	je	0x4010e0 <register_tm_clones+0x30>
  4010cf: b8 00 00 00 00               	movl	$0, %eax
  4010d4: 48 85 c0                     	testq	%rax, %rax
  4010d7: 74 07                        	je	0x4010e0 <register_tm_clones+0x30>
  4010d9: bf 30 40 40 00               	movl	$4210736, %edi          # imm = 0x404030
  4010de: ff e0                        	jmpq	*%rax
  4010e0: c3                           	retq
  4010e1: 66 66 2e 0f 1f 84 00 00 00 00 00     	nopw	%cs:(%rax,%rax)
  4010ec: 0f 1f 40 00                  	nopl	(%rax)

00000000004010f0 <__do_global_dtors_aux>:
  4010f0: f3 0f 1e fa                  	endbr64
  4010f4: 80 3d 35 2f 00 00 00         	cmpb	$0, 12085(%rip)         # 0x404030 <completed.0>
  4010fb: 75 13                        	jne	0x401110 <__do_global_dtors_aux+0x20>
  4010fd: 55                           	pushq	%rbp
  4010fe: 48 89 e5                     	movq	%rsp, %rbp
  401101: e8 7a ff ff ff               	callq	0x401080 <deregister_tm_clones>
  401106: c6 05 23 2f 00 00 01         	movb	$1, 12067(%rip)         # 0x404030 <completed.0>
  40110d: 5d                           	popq	%rbp
  40110e: c3                           	retq
  40110f: 90                           	nop
  401110: c3                           	retq
  401111: 66 66 2e 0f 1f 84 00 00 00 00 00     	nopw	%cs:(%rax,%rax)
  40111c: 0f 1f 40 00                  	nopl	(%rax)

0000000000401120 <frame_dummy>:
  401120: f3 0f 1e fa                  	endbr64
  401124: eb 8a                        	jmp	0x4010b0 <register_tm_clones>
  401126: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

0000000000401130 <main>:
; int main() {
  401130: 55                           	pushq	%rbp
  401131: 48 89 e5                     	movq	%rsp, %rbp
  401134: 48 83 ec 10                  	subq	$16, %rsp
  401138: c7 45 fc 00 00 00 00         	movl	$0, -4(%rbp)
;     printf("Hello, LLVM!\n");
  40113f: 48 bf 04 20 40 00 00 00 00 00	movabsq	$4202500, %rdi          # imm = 0x402004
  401149: b0 00                        	movb	$0, %al
  40114b: e8 e0 fe ff ff               	callq	0x401030 <printf@plt>
;     return 0;
  401150: 31 c0                        	xorl	%eax, %eax
  401152: 48 83 c4 10                  	addq	$16, %rsp
  401156: 5d                           	popq	%rbp
  401157: c3                           	retq

Disassembly of section .fini:

0000000000401158 <_fini>:
  401158: f3 0f 1e fa                  	endbr64
  40115c: 48 83 ec 08                  	subq	$8, %rsp
  401160: 48 83 c4 08                  	addq	$8, %rsp
  401164: c3                           	retq

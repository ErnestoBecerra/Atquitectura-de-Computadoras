	.file	"Burbuja.c"
	.def	___main;	.scl	2;	.type	32;	.endef
	.text
.globl _main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$120, %esp
	andl	$-16, %esp
	movl	$0, %eax
	addl	$15, %eax
	addl	$15, %eax
	shrl	$4, %eax
	sall	$4, %eax
	movl	%eax, -92(%ebp)
	movl	-92(%ebp), %eax
	call	__alloca
	call	___main
	leal	-88(%ebp), %eax
	movl	%eax, (%esp)
	call	_crearVector
	leal	-88(%ebp), %eax
	movl	%eax, (%esp)
	call	_mostrarArreglo
	leal	-88(%ebp), %eax
	movl	%eax, (%esp)
	call	_burbuja
	leal	-88(%ebp), %eax
	movl	%eax, (%esp)
	call	_mostrarBurbuja
	movl	$0, %eax
	leave
	ret
.globl _crearVector
	.def	_crearVector;	.scl	2;	.type	32;	.endef
_crearVector:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$12, %esp
	movl	$0, (%esp)
	call	_time
	movl	%eax, (%esp)
	call	_srand
	movl	$0, -16(%ebp)
L3:
	cmpl	$19, -16(%ebp)
	jg	L2
	movl	-16(%ebp), %eax
	leal	0(,%eax,4), %ebx
	movl	8(%ebp), %esi
	call	_rand
	movl	%eax, %edi
	movl	$680390859, %eax
	imull	%edi
	sarl	$4, %edx
	movl	%edi, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, (%ebx,%esi)
	movl	(%ebx,%esi), %ecx
	movl	%ecx, %eax
	sall	$2, %eax
	addl	%ecx, %eax
	leal	0(,%eax,4), %edx
	addl	%edx, %eax
	sall	$2, %eax
	addl	%ecx, %eax
	subl	%eax, %edi
	movl	%edi, %eax
	movl	%eax, (%ebx,%esi)
	leal	-16(%ebp), %eax
	incl	(%eax)
	jmp	L3
L2:
	addl	$12, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.section .rdata,"dr"
	.align 4
LC0:
	.ascii "Se muestra arreglo sin acomodar\12\0"
LC1:
	.ascii "%d, \0"
LC2:
	.ascii "\12\0"
	.text
.globl _mostrarArreglo
	.def	_mostrarArreglo;	.scl	2;	.type	32;	.endef
_mostrarArreglo:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movl	$LC0, (%esp)
	call	_printf
	movl	$0, -4(%ebp)
L7:
	cmpl	$19, -4(%ebp)
	jg	L8
	movl	-4(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	movl	(%edx,%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_printf
	leal	-4(%ebp), %eax
	incl	(%eax)
	jmp	L7
L8:
	movl	$LC2, (%esp)
	call	_printf
	leave
	ret
.globl _burbuja
	.def	_burbuja;	.scl	2;	.type	32;	.endef
_burbuja:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	subl	$12, %esp
	movl	$0, -8(%ebp)
L11:
	cmpl	$19, -8(%ebp)
	jg	L10
	movl	$0, -12(%ebp)
L14:
	cmpl	$19, -12(%ebp)
	jg	L13
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %ecx
	movl	8(%ebp), %ebx
	movl	-12(%ebp), %eax
	sall	$2, %eax
	addl	8(%ebp), %eax
	leal	4(%eax), %edx
	movl	(%ecx,%ebx), %eax
	cmpl	(%edx), %eax
	jle	L16
	movl	-12(%ebp), %eax
	sall	$2, %eax
	addl	8(%ebp), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	movl	%eax, -16(%ebp)
	movl	-12(%ebp), %eax
	sall	$2, %eax
	addl	8(%ebp), %eax
	leal	4(%eax), %ecx
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	movl	(%edx,%eax), %eax
	movl	%eax, (%ecx)
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %ecx
	movl	8(%ebp), %edx
	movl	-16(%ebp), %eax
	movl	%eax, (%ecx,%edx)
L16:
	leal	-12(%ebp), %eax
	incl	(%eax)
	jmp	L14
L13:
	leal	-8(%ebp), %eax
	incl	(%eax)
	jmp	L11
L10:
	addl	$12, %esp
	popl	%ebx
	popl	%ebp
	ret
	.section .rdata,"dr"
	.align 4
LC3:
	.ascii "\12Se muestra arreglo ordenado mediante ordenamiento de burbuja:\12\0"
	.text
.globl _mostrarBurbuja
	.def	_mostrarBurbuja;	.scl	2;	.type	32;	.endef
_mostrarBurbuja:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movl	$LC3, (%esp)
	call	_printf
	movl	$0, -4(%ebp)
L19:
	cmpl	$19, -4(%ebp)
	jg	L20
	movl	-4(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	movl	(%edx,%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_printf
	leal	-4(%ebp), %eax
	incl	(%eax)
	jmp	L19
L20:
	movl	$LC2, (%esp)
	call	_printf
	leave
	ret
	.def	_printf;	.scl	3;	.type	32;	.endef
	.def	_rand;	.scl	3;	.type	32;	.endef
	.def	_time;	.scl	3;	.type	32;	.endef
	.def	_srand;	.scl	3;	.type	32;	.endef
	.def	_mostrarBurbuja;	.scl	3;	.type	32;	.endef
	.def	_burbuja;	.scl	3;	.type	32;	.endef
	.def	_mostrarArreglo;	.scl	3;	.type	32;	.endef
	.def	_crearVector;	.scl	3;	.type	32;	.endef

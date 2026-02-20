.section .rodata
prompt1: .ascii "Enter first string: "
prompt1_len = . - prompt1

prompt2: .ascii "Enter second string: "
prompt2_len = . - prompt2

outmsg:  .ascii "Hamming distance: "
outmsg_len = . - outmsg

newline: .byte 10

.section .bss
.lcomm s1, 257
.lcomm s2, 257
.lcomm numbuf, 32

.section .text
.globl _start

write_stdout:
    mov $1, %rax
    mov $1, %rdi
    syscall
    ret

read_stdin:
    mov $0, %rax
    mov $0, %rdi
    syscall
    ret

strip_newline_and_len:
    xor %rax, %rax
.Lsnl_loop:
    cmp %rax, %rsi
    je  .Lsnl_done

    movb (%rdi,%rax,1), %dl
    testb %dl, %dl
    je .Lsnl_done

    cmpb $10, %dl
    je .Lsnl_zero

    inc %rax
    jmp .Lsnl_loop

.Lsnl_zero:
    movb $0, (%rdi,%rax,1)
.Lsnl_done:
    ret

count_bits8:
    push %rbx

    xor %eax, %eax
.Lcb_loop:
    test %dil, %dil
    je .Lcb_done

    mov %dil, %bl
    and $1, %bl
    add %bl, %al

    shr $1, %dil
    jmp .Lcb_loop

.Lcb_done:
    movzbl %al, %eax
    pop %rbx
    ret

u64_to_dec:
    lea numbuf(%rip), %r8
    lea 32(%r8), %r9
    mov %r9, %rsi

    cmp $0, %rax
    jne .Lconv_loop

    dec %rsi
    movb $'0', (%rsi)
    mov $1, %rdx
    ret

.Lconv_loop:
    xor %rdx, %rdx
    mov $10, %rcx
    div %rcx

    addb $'0', %dl
    dec %rsi
    movb %dl, (%rsi)

    test %rax, %rax
    jne .Lconv_loop

    mov %r9, %rdx
    sub %rsi, %rdx
    ret

_start:
    lea prompt1(%rip), %rsi
    mov $prompt1_len, %rdx
    call write_stdout

    lea s1(%rip), %rsi
    mov $256, %rdx
    call read_stdin
    mov %rax, %r12

    lea s1(%rip), %rdi
    mov %r12, %rsi
    call strip_newline_and_len
    mov %rax, %r8

    lea prompt2(%rip), %rsi
    mov $prompt2_len, %rdx
    call write_stdout

    lea s2(%rip), %rsi
    mov $256, %rdx
    call read_stdin
    mov %rax, %r13

    lea s2(%rip), %rdi
    mov %r13, %rsi
    call strip_newline_and_len
    mov %rax, %r9

    mov %r8, %rcx
    cmp %r9, %rcx
    cmova %r9, %rcx

    xor %rbx, %rbx

    lea s1(%rip), %r10
    lea s2(%rip), %r11

    xor %rdx, %rdx
    test %rcx, %rcx
    je .Lprint

.Lloop:
    movzbl (%r10,%rdx,1), %eax
    movzbl (%r11,%rdx,1), %esi
    xor %esi, %eax

    mov %al, %dil
    call count_bits8
    add %rax, %rbx

    inc %rdx
    cmp %rcx, %rdx
    jb .Lloop

.Lprint:
    lea outmsg(%rip), %rsi
    mov $outmsg_len, %rdx
    call write_stdout

    mov %rbx, %rax
    call u64_to_dec
    call write_stdout

    lea newline(%rip), %rsi
    mov $1, %rdx
    call write_stdout

    mov $60, %rax
    xor %rdi, %rdi
    syscall

.section .note.GNU-stack,"",@progbits

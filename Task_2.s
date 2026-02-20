.section .bss
.global ram
.lcomm ram, 256             #reserves 256 bytes of ram (not initialized yet)

.section .text
.global fill_ram            #makes the function visible to C program

fill_ram:
    #Store the FFh into RAM locations 50H - 58H using indirect addressing
    mov $ram, %rdi
    add $0x50, %rdi

    movb $0xFF, (%rdi) #ram+0x50
    inc %rdi
    movb $0xFF, (%rdi) #ram+0x51
    inc %rdi
    movb $0xFF, (%rdi) #ram+0x52
    inc %rdi
    movb $0xFF, (%rdi) #ram+0x53
    inc %rdi
    movb $0xFF, (%rdi) #ram+0x54
    inc %rdi
    movb $0xFF, (%rdi) #ram+0x55
    inc %rdi
    movb $0xFF, (%rdi) #ram+0x56
    inc %rdi
    movb $0xFF, (%rdi) #ram+0x57
    inc %rdi
    movb $0xFF, (%rdi) #ram+0x58
    inc %rdi

    ret                     #return the control back to C program

.section .note.GNU-stack,"",@progbits

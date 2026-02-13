.section .bss
.global ram
.lcomm ram, 256             #reserves 256 bytes of ram (not initialized yet)

.section .text
.global fill_ram            #makes the function visible to C program

fill_ram:
    mov $0, %eax            #starts at 0
    mov $10, %ecx           #set N = 10

sum_loop:
    add %ecx, %eax          # add current N to sum
    loop sum_loop           #decrement ecx and decrement jump if not zero

    #store the result
    movb %al, ram+0x50

    ret                     #return control to C program
.section .note.GNU-stack,"",@progbits

.section .bss
.global ram
.lcomm ram, 256             #reserves 256 bytes of ram (not initialized yet)

.section .text
.global fill_ram            #makes the function visible to C program

fill_ram:
    #clear RAM locations 50H - 58H

    movb $0x00, ram+0x50
    movb $0x00, ram+0x51
    movb $0x00, ram+0x52
    movb $0x00, ram+0x53
    movb $0x00, ram+0x54
    movb $0x00, ram+0x55
    movb $0x00, ram+0x56
    movb $0x00, ram+0x57
    movb $0x00, ram+0x58

    ret                     #return the control back to C program

.section .note.GNU-stack,"",@progbits

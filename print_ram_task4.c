#include <stdio.h>
extern unsigned char ram[]; //ram declared in assembly
extern void fill_ram(void);
int main()
{fill_ram();
    printf("RAM contents from 50H to 58H:\n");

    //decimal value in 0x50
    printf("%02d ", ram[0x50]);

    printf("\n");

    return 0;
}
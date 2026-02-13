#include <stdio.h>
extern unsigned char ram[]; //ram declared in assembly
extern void fill_ram(void);
int main()
{fill_ram();
    printf("RAM contents from 50H to 58H:\n");

    for(int i = 0x50; i <= 0x58; i++)
    { printf("%02x ", ram[i]); }

    printf("\n");

    return 0;
}
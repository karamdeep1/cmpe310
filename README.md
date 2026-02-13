# cmpe310
to see the results of this program:

First cd in Lab1 directory if not already in it

Then build the code using the terminal command:
gcc -nostdlib -no-pie print_hello.s -o hello ./hello

Note: If the program is already built, running the above terminal command will fail because the program is already built. An error message pops up saying "gcc: fatal error: input file ‘hello’ is the same as output file". Either move onto the next step like this or remove the file and then run the terminal command again to rebuild it.

Finally after building the executable, run it with the terminal command ./hello to execute the program.
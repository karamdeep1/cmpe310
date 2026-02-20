# Lab2

## Hamming Distance
To see the results of the Hamming Distance program:

1. First cd in Lab2 directory if not already in it

2. Then build the code using the terminal command:
```bash
gcc -nostdlib -no-pie hammingDistance.s -o hammingDistance
```

3. Finally after building the executable, run it with the below terminal command to execute the program.
```bash
./hammingDistance
```

## Additional Notes
If the program was already built, running the terminal command that builds the program will fail because the program is already built. An error message pops up saying "gcc: fatal error: input file 'name of file' is the same as output file". Either move onto the next step like this or remove the file and then run the terminal command again to rebuild it.
# Lab1
## Hello World
To see the results of the Hello World program:

1. First cd in Lab1 directory if not already in it

2. Then build the code using the terminal command:
```bash
gcc -nostdlib -no-pie print_hello.s -o hello ./hello
```

3. Finally after building the executable, run it with the below terminal command to execute the program.
```bash
./hello
```



## Task 1
To see the results of the Task 1 program:

1. cd in Lab1 directory if not already in it

2. Then build the code using the terminal command:
```bash
gcc -no-pie Task_1.s print_ram.c -o task1
```

3. Finally after building the executable, run it with the below terminal command to execute the program.
```bash
./task1
```



## Task 2
To see the results of the Task 2 program:

1. cd in Lab1 directory if not already in it

2. Then build the code using the terminal command:
```bash
gcc -no-pie Task_2.s print_ram.c -o task2
```

3. Finally after building the executable, run it with the below terminal command to execute the program.
```bash
./task2
```



## Task 3
To see the results of the Task 3 program:

1. cd in Lab1 directory if not already in it

2. Then build the code using the terminal command:
```bash
gcc -no-pie Task_3.s print_ram.c -o task3
```

3. Finally after building the executable, run it with the below terminal command to execute the program.
```bash
./task3
```



## Task 4
To see the results of the Task 4 program:

1. cd in Lab1 directory if not already in it

2. Then build the code using the terminal command:
```bash
gcc -no-pie Task_4.s print_ram_task4.c -o task4
```

3. Finally after building the executable, run it with the below terminal command to execute the program.
```bash
./task4
```


## Additional Notes
If either of the programs are already built, running the terminal command that builds the program will fail because the program is already built. An error message pops up saying "gcc: fatal error: input file 'name of file' is the same as output file". Either move onto the next step like this or remove the file and then run the terminal command again to rebuild it.
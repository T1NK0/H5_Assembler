// Usage: Put a number (n) in RAM[0]
// D = DataRegister
// A = Address
// M = Ram[A]

@R0 // RAM[0] (RAM[A])
D = M // Write how many iterations you want in the ram, and read the memory (Ram[0])

// Variables
@n // Ram[16]
M = D // Set Ram[16] = value of Ram[0] (R0)
@i // Ram[17]
M = 1 // Set Ram[17] = 1
@sum // Ram[18]
M = 0 // Sets sum = 0 in the Ram[18].

(LOOP)
    @i // Ram[17]
    D = M // Reads the value of Ram[18]
    
    @n // Ram[16]
    D = D - M // Register = Ram[16] - value of Ram[17] 

    @STOP
    D;JGT // IF i > n GOTO/JUMP TO STOP
    
    @sum // Ram[18]
    D = M // Set data register to value of Ram[18]

    @i // Ram[17]
    D = D + M // value of iteration + total time, to get iteration, since the minus resulted in minus number earlier.

    @sum // Ram[18]
    M = D // Ram[18] = Ram[18] + i (Calculated leftover number by adding sum with the . number from the previous calculation)

    @i // Ram[17]
    M = M + 1 // i = i + 1 Calculates if inpiut is 4 (1+2+3+4) and so on.

    @LOOP // Jumop to "Loop", since the "Stop" requirement has not been met to break the loop.
    0;JMP
(STOP)
    @sum // Ram[18]
    D = M // Ram[18] = Current iteration (Should result in inputted value in Ram[0])

    @R1
    M = D // Ram[1] = sum
(END) // Loops to not run malicious code.
    @END
    0;JMP
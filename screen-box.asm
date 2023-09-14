// Usage: Put a number (n) in RAM[0]
// D = DataRegister
// A = Address
// M = Ram[A]

@SCREEN
D = A // Set Screen starting position from RAM[16384] because of the screen tag, that is where the screen element starts.

@1 // RAM[1]
M = D // Set memory of RAM[1] to value of @SCREEN (Address 0)

D = -1 // D get's set to value of -1.

(LOOP)
@1
A = M // Set the A register to the memory address Stored in Ram[1], and increment it with the value at the given address.

M = D // Set the value of the RAM[1] to -1

@1
M = M + 1 // Loads the value from the address into the 

@LOOP
0;JMP // Jump back to the loop to continue the iteration.
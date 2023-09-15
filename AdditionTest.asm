// Program: Addition 2
// Computes: RAM[2] = RAM[0] + RAM[1]
// Usage: Put values in RAM[0], RAM[1]

// D: Dataregister
// A: Adress
// M: Selected memoryregister: M = RAM[A]

(LOOP)
@0
D = M // D = RAM[0]

@1
D = D + M // D = D + RAM[1]

@2
M = D // RAM[3] = D

@3
0;JMP
// D = DataRegister
// A = Address
// M = Ram[A]

// @R2
// M=0 // Set Ram[2] to value 0

// @i
// M=0 // Set iteration (Ram[17]) to 0

// (LOOP)
//     @i
//     D=M // Set the register to the value of Ram[17].
    
//     @R1
//     D=D-M // Set the register address to the value of the current register - the memory slot

//     @END
//     D;JLT // If i>R1, goto end.

//     //R2=R2+R0
//     @R0
//     D=M // Set the register to the value of Ram[0]

//     @R2
//     M=M+D // Se the Ram[2] value to the value of the memory + the register value.

//     // i++
//     @i
//     M=M+1 // add 1 to the iteration ram, to say we have done a round. 

//     @LOOP
//     0;JMP // Repeat till we reach the END query.

// (END)
//     @END
//     0;JMP

@R0
D = M // Set Register to Ram[0]

@a
M = D // Set the a variable to Ram[0]

@R1
D = M // Set Register to Ram[1]

@b
M = D // Set b variable to Ram[1]

@0
D = A // Set the register to point to the value of Ram[0]

@R2
M = D //Set the Ram[2] value to the previous set value.

(NOT_ZERO)
@a
D = M // Set register to A's value

@b
D = D - M // Set b register to variable a - variable b.

@END
D;JLT // If a-b IS less than 0, got to end

@ZERO
D;JEQ // If a-b is 0 go to zero, so we still count the 0.

@R2
M = M + 1 //Set the value of Ram[2] + 1 as the counter of how many times it fits inside, as we break when we reach the limit

@b
D = M // Set the register to the value of the b variable. 

@a
M = M - D // Set the a variable to the result of variable a - b
@NOT_ZERO
0;JMP

(ZERO)
@R2
M = M + 1 // Add the extra iteration

(END)
    @END
    0;JMP
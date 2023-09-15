// Screen is white by default. 
// Fill screen with black color when any keyboard key is pressed down.
// Fill screen with white when pressed up.
// Screen is filled from bottom to top.

// D = DataRegister
// A = Address
// M = Ram[A]
(LOOP)
    @KBD
    D = A - 1 // Set Screen starting position from RAM[16384] because of the screen tag, that is where the screen element starts.
    
    @PIXEL_INDEX
    M = D // Set the index of the pixel to the start of the screen.

    @KBD
    D = M // Set's the value of the keyboard.

    @WHITE
    D;JEQ // Go to WHITE, if nothing is pressed. (If D = 0 )
    D = - 1

(WHITE)
    @COLOR
    M = D // A varaible where we can save the color wished (0 or 1 (1 is black))

(DRAW_LOOP)
    @PIXEL_INDEX
    D = M // Store the index in the register.

    @KBD
    D = D + A // Set the Register to keyboard start value (24576)

    @LOOP
    D;JGE

    @COLOR
    D = M // Set the register to the color.

    @PIXEL_INDEX
    A = M // Set the current address.
    M = D // Sets the pixels value based on our @COLOR.
    D = A - 1 // Sets the next pixels address to the registry

    @PIXEL_INDEX
    M = D // Sets the new pixels index to the index from our previous set pixel.

    @DRAW_LOOP
    0;JMP // Jump back to the loop to continue the iteration.
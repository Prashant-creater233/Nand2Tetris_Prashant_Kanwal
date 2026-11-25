// Nand2Tetris Capstone - Make the Computer Draw a Box
// Name: Prashant Kanwal
// Roll No.: 2501730468
// K = 68
// Box starts at screen row 68, is 20 rows tall, and is 16 pixels wide.
// One Hack word = 16 pixels, so exactly one word is written per row.
// Start address = SCREEN + 32*K = 16384 + 2176 = 18560.

(LOOP)
    // Read keyboard. Non-zero means a key is pressed.
    @KBD
    D=M
    @BLACK
    D;JNE

    // No key: white (erase the box).
    @0
    D=A
    @R15
    M=D
    @DRAW
    0;JMP

(BLACK)
    // Key pressed: all 16 bits set, producing black pixels.
    @1
    D=-A
    @R15
    M=D

(DRAW)
    // First pixel word of screen row 68.
    @18560
    D=A
    @R13
    M=D

    // Draw 20 rows.
    @20
    D=A
    @R14
    M=D

(ROW)
    // Write one 16-pixel word.
    @R15
    D=M
    @R13
    A=M
    M=D

    // Move to the same horizontal position in the next screen row.
    // Each screen row contains 32 words.
    @32
    D=A
    @R13
    M=D+M

    // Decrement row counter and continue while rows remain.
    @R14
    MD=M-1
    @ROW
    D;JGT

    // Continuously check the keyboard.
    @LOOP
    0;JMP

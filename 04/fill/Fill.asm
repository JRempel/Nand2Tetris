// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.


(INITINDEX)
	// Initialize Index to 8192
	@8192
	D=A
	@INDEX
	M=D

(LOOP)
	// Decrement index, reset to max value if index < 0
	@INDEX
	M=M-1
	D=M
	@INITINDEX
	D;JLT
	
	// Load the Keyboard address
	@KBD
	D=M
	
	// If the value at the Keyboard address is 0 (not pressed), jump to WHITE, else jump to BLACK
	@WHITE
	D;JEQ
	@BLACK
	0;JMP

(WHITE)
	// Add the current Index to the initial Screen value to color the correct set of pixels
	@SCREEN
	D=A
	@INDEX
	A=D+M
	
	// Set the value to 0 so all 16px are cleared
	M=0
	@LOOP
	0;JMP

(BLACK)
	// Add the current Index to the initial Screen value to color the correct set of pixels
	@SCREEN
	D=A
	@INDEX
	A=D+M
	
	// Set the value to -1 which in 2's C is 11....11 so all 16px are filled
	M=-1
	@LOOP
	0;JMP
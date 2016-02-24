// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

// Set the value at R2 to 0
	@R2
	M=0

// End the program if the value of R0 is 0
	@R0
	D=M
	@END
	D;JEQ

// End the program if the value of R1 is 0
	@R1
	D=M
	@END
	D;JEQ

// Set a counter equal to the value of R0
	@R0
	D=M
	@COUNTER
	M=D
	
// R2 += R1 R0 number of times
	(LOOP)
	// Check for loop exit
		@COUNTER
		D=M
		@END
		D;JEQ
		
	// Increment R2
		@R1
		D=M
		@R2
		M=M+D
	
	//Decrement Counter
		@COUNTER
		M=M-1
		
	// Jump to the beginning of the loop	
		@LOOP
		0;JMP

// End the program by way of an infinite loop
	(END)
	@END
	0; JMP
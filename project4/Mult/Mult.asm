// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.

//// Replace this comment with your code.
//R2 <--- 0
@R2
M=0

//if R0 equals 0 = end prog
@R0
D=M
@END
D;JEQ
 
//if R1 equals 0 = end prog
@R1
D=M
@END
D;JEQ

//inserting R0 to i as an iterator
@R0
D=M
@count
M=D


(LOOP)
  // R2 = R2 + R1
  @R1
  D=M
  @R2
  M=D+M

  //i = i - 1
  @count
  M=M-1
  D=M
  @LOOP
  D;JGT

(END)
  @END
  0;JMP

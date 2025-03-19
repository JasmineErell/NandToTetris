// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/6/rect/Rect.asm

// Draws a rectangle at the top-left corner of the screen.
// The rectangle is 16 pixels wide and R0 pixels high.
// Usage: Before executing, put a value in R0.


//CHECKS STATUS OF KBD
(STATUS)
   //coloring the whole screen
   @8192
   D=A
   @R0
   M=D
   @n
   M=D
   // checking status ok KBD
   @KBD
   D=M
   @SETUPBLACK
   D;JNE
   @SETUPWHITE
   D;JEQ
   @STATUS
   0;JMP
(SETUPBLACK)
// addr = base address of first screen row
   @SCREEN
   D=A
   @addr
   M=D
(BLACKLOOP)
   // RAM[addr] = -1
   @addr
   A=M
   M=-1
   // addr = base address of next screen row
   @addr
   D=M
   @1
   D=D+A
   @addr
   M=D
   // decrements n and loops
   @n
   MD=M-1
   @BLACKLOOP
   D;JGT
   //going back to check if a key is pressed or not
   @STATUS
   0;JMP

(SETUPWHITE)
// addr = base address of first screen row
   @SCREEN
   D=A
   @addr
   M=D
(WHITELOOP)
   // RAM[addr] = 0
   @addr
   A=M
   M=0
   // addr = base address of next screen row
   @addr
   D=M
   @1
   D=D+A
   @addr
   M=D
   // decrements n and loops
   @n
   MD=M-1
   @WHITELOOP
   D;JGT
   //going back to check if a key is pressed
   @STATUS
   0;JMP
(END)
   @END
   0;JMP
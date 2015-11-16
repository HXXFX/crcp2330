// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Put your code here.

(END)

@KBD
D=M

@FILLBLACK
D;JNE
@FILLWHITE
D;JEQ


(FILLBLACK)
@8191
D=A
@counterb
M=D

(DRAWBLACK)
@counterb
D=M
@END
D;JLT //finish DRAW and jump out 

@SCREEN
A=A+D
M=-1

@counterb
M=M-1

@DRAWBLACK
0;JMP

(FILLWHITE)
@8191
D=A
@counterw
M=D

(DRAWWHITE)
@counterw
D=M
@END
D;JLT //finish DRAW and jump out 

@SCREEN
A=A+D
M=0

@counterw
M=M-1

@DRAWWHITE
0;JMP


@END
0;JMP

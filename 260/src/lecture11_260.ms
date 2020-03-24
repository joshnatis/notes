.so ../../macros
.DA
.green
.AU
CS260, Computer Architecture II
.neerg
.TL
Lecture 11

.QP
On the structure of programs in memory, and how to preserve variables throughout function calls by using the stack

.green
.SH
Programs in memory
.neerg
.LP
.bullet
When a program runs, it is allocated some space in RAM

.I "MAX"
.TS
tab(;) allbox;
c;.
STACK

HEAP
DATA
TEXT
.TE
.I "0"

.UL "Text" " - the code itself"

.UL "Data" " - data that persists as the programs runs (e.g. global/static variables)"

.UL "Heap" " - also known as 'free storage'. Heap size is dynamic; it constantly grows/shrinks (new/delete), and as such its size isn't known at the start."

.UL "Stack" " - Contains all local variables, temporary information, parameters, return addresses, etc. The stack is usually small, has a max size that the OS will allow it to be."

.bullet
The stack grows downwards -- the larger it is, the closer it gets to the heap 
.bullet
The heap grows upwards, towards the stack

.bullet
Theoretically, if the stack gets large enough, there may be a stack overflow (the stack and heap collide). This may happen if you allocate too much space in a static array, or have recursion that's too deep.
.RS
.bullet
In practice, this won't happen, because the MAX for a stack is very large.
.bullet
.I "Note: the MAX is not related to how much RAM you have -- it's typically huge (terabytes/petabytes)"
.RE

.KS
.LP
All programs sit somewhere in the RAM, each with the previously mentioned structure.

.B "RAM"

.I "MAX"
.TS
tab(;) allbox;
c;.
PROGRAM 1

PROGRAM 2



PROGRAM 3
.TE
.I "0"
.KE

.LP
However, each program believes that it starts at address 0 and ends at its MAX. Then, the operating system breaks it into chunks and scatters it across RAM. As a consequence, we write each program as if it's the only program using the RAM.

.PS
line;line;line;line;line;line;line;
.PE

.green
.SH
More on the stack
.neerg
.LP

What happens if we need to use more registers than we have available in our program? (for example, you may be storing many values that need to be preserved).

Solution: We can use the stack to preserve values while we use registers for other purposes, then restore the registers and values back to their original state.

.UL "Stack pointer" " - points to the lowest edge of the stack"
.RS
.bullet
Stored in $sp
.bullet
To allocate memory for the stack, move the stack pointer down (subtract bytes, e.g. 4)
.RE


.UL "EXAMPLE 1"

.I "# preserve previous state of S registers using the stack"
.LP
.CW "FUNC:"
.LP
.CW "	ADDI $sp, $sp, -4"
.I "	#allocate 4 bytes more"
.LP
.CW "	SW   $s0, 0($sp)"
.I "	  #store $s0 in $sp"
.LP
.CW "	..."
.LP
.CW "	ADDI $s0, $zero, 1"
.I "       #mess up $s0"
.LP
.CW "	..."
.LP
.CW "	LW	$s0, 0($sp)"
.I "	   #load original $s0 value back, restore state"
.LP
.CW "	ADDI $sp, $sp, 4"
.I "	 #restore stack pointer to how it was before (deallocate)"
.LP
.CW "	JR	$ra"
.I "			  #return control to caller"


.UL "EXAMPLE 2"

.I "# preserve previous state of S registers using the stack (2 registers)"
.LP
.CW "FUNC:"
.LP
.CW "	ADDI $sp, $sp, -8"
.I "	#allocate for 2 registers"
.LP
.CW "	SW   $s0, 4($sp)"
.I "	  #save $s0, 4 bytes up cause the top of new stack portion is 8 bytes up"
.LP
.CW "	SW   $s1, 0($sp)"
.I "	  #goes on bottom of new stack portion"
.LP
.CW "	..."
.LP
.CW "	ADDI $s0, $zero, 1"
.I "       #mess up $s0"
.LP
.CW "	..."
.LP
.CW "	LW	$s0, 4($sp)"
.I "	   #restore $s0 state"
.LP
.CW "	LW	$s1, 0($sp)"
.I "	   #restore $s1 state"
.LP
.CW "	ADDI $sp, $sp, 8"
.I "	 #restore stack pointer to how it was before (deallocate)"
.LP
.CW "	JR	$ra"
.I "			  #return control to caller"

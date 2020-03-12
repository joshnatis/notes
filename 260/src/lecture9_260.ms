.so ../../macros
.DA
.green
.AU
CS260, Computer Architecture II
.neerg
.TL
Lecture 9
.QP
On branching -- how can we implement conditional logic and loops in assembly language? How do we translate C++ programs using those elements to MIPS?
.green
.SH
Branching and Loops
.neerg
.bullet
To implement if statements in MIPS, we can use "branching"
.bullet
All branch instructions do comparisons
.bullet
BEQ (branch if equal), BNE (branch if not equal)
.RS
.bullet
.CW "BEQ $s0, $s1, LABEL1"
.I " (if $s0 == $s1, jump to LABEL1)"
.RE
.bullet
A label in a programming language is a sequence of characters that identifies a location within source code

.UL "Example"
.LP
	C++		

.CW "		if (i != 0) i++;"

.LP
	MIPS	
.I "	Let i be in $s0"

.CW "		BEQ $s0, $zero, L1"
.LP
.CW "		ADDI $s0, $s0, 1"
.LP
.CW "		L1:"

.SM
.I "		This works because we jump over the ADDI instruction if we meet the condition"

.bullet
We can also use branching to implement loops
.LP
	C++		

.CW "		for(int i = 0; i < 10; ++i)"

.CW "			var++;"

.LP
	MIPS	

.CW "		ADDI $t0, $zero, $zero"
.I  "	#initialize start, i = 0"
.LP
.CW "		ADDI $t1, $zero, 10"
.I  "	       #initialize stop, i = 10"

.CW "LOOP:	BEQ $t0, $t1, END"
.I "		 #if i == 10, end the loop"
.LP
.CW "		ADDI $s0, $zero, 1"
.I "	        # var++, given var is in s0"
.LP
.CW "		ADDI $t0, $zero, 1"
.I "	        # increment counter, i++"
.LP
.CW "		BEQ $zero, $zero, LOOP"
.I "        # always loop back to the top
.LP
.CW "END:"

.bullet
The basic idea is that we keep looping until our index variable and the stop are equal, at which point we jump over the loop to the following instructions.
.bullet
Notice the line
.CW "BEQ $zero, $zero, LOOP"
-- this always evaluates to true, so we loop back every time we finish executing the body of the loop. There's actually a specific instruction that is meant to jump unconditionally.
.bullet
.CW "J"
-- unconditional jump
.RS
.bullet
.I "In our example, we would replace that line with"
.CW " J LOOP"
.RE

.green
.SH
Comparing values (less than)
.neerg
.LP
.bullet
What would happen if our loop above incremented i by 3 instead of by 1?
.bullet
Our trick of checking if i == 10 to determine when to stop would fail, because i would skip over 10 (straight to 12), and the loop would continue indefinitely, since the condition is never met.
.bullet
A solution would be to use the 
.I "less than " operator!

.B "SLT -- Set on less than (signed)"
.RS
.bullet
Compares two registers, if the value in the first is less than the value in the second, it "sets" the first bit of the destination register (makes the rightmost bit 1)
.bullet
.CW "SLT $s0, $t0, $t1"
.I "		# is t0 < t1? set s0 if yes"
.bullet
Of course we also have
.CW "SLTI"
, which does the same thing but accepts an immediate
.RE

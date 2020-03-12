.so ../../macros
.DA
.green
.AU
CS260, Computer Architecture II
.neerg
.TL
Lecture 10
.QP
On functions -- how to implement them in assembly language, and the commands and protocols associated with them (JAL, JR, $ra, $a0-a3, $v0-v1, persisting registers, etc)
.green
.SH
Functions/Function Calls
.neerg
.bullet
The basic idea: a function will be defined as some code following a label (with the function name). The caller jumps to the label and executes the following code until it receives an instruction to return control to the instruction after the original function call. Passing parameters and return values is handled by storing them in registers meant for the purpose.

.bullet
.CW "JAL"
- jump and link
.RS
.bullet
When we jump to a function, we need to know the location of the next instruction (before jumping), so we know where to return control to afterwards
.bullet
JAL automatically stores addres of the next instruction in the
.CW "$ra"
register when called
.bullet
Call with
.CW "JAL function_name"
.bullet
return control with 
.CW "JR $ra"
.I " (jump to the address specified in $ra)"
.RE

.UL Caller
- the function doing the calling (e.g. the
.I "main"
function calls the
.I "pow " function)

.UL Callee
- the function being called

.LP
How do we pass parameters?
.RS
.bullet
registers
.CW "a0 - a3"
are used to accept parameters
.bullet
registers
.CW "v0 - v1"
are used to return the result
.bullet
.I "Specify in a comment above your function definition which registers should be loaded with parameters (in what order), and similarly with return values."
.RE
.PS
line;line;line;line;line;line;line;
.PE
A note on convention -- persistent registers.

.bullet
By convention, we decide that some register types have their state/value preserved after calling a function, while others don't. For example, s registers cannot have their value mangled after a call to a function -- they are guaranteed to be unchanged. t registers, on the other hand, have no guarantee of maintaining their state -- functions can freely change and repurpose them without preserving their values upon return to the caller.

.LP
A note on pseudoinstructions

.bullet
A pseudoinstruction is something that isn't a direct mnemonic to a machine instruction, but is allowed by the assembler anyhow. A common example is the
.CW "LI"
(load immediate) command, which is equivalent to using 
.CW "ADDI $target, $zero, val"
, without the burden of the $zero register. 

'bp
.UL "EXAMPLE"

Create the function INCREMENT
.bullet
accepts integer in a0
.bullet
increases integer by 1
.bullet
returns result in v0

.LP
.UL "CALLER"

.CW "ADDI $a0, $zero, 5"
.I "		#load value into param"
.LP
.CW "JAL INCREMENT"
.I "			#jumps to function (calls)
.LP
.CW "..."

.UL "CALLEE"

.CW "INCREMENT:"
.I "				#label/function name"
.LP
.CW "ADDI $v0, $a0, 1"
.I "			#Increment, load result into return register"
.LP
.CW "JR $ra"
.I "					#jump to next instruction in caller"



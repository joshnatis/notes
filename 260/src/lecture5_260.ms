.so ../../macros
.DA
.green
.AU
CS260, Computer Architecture II
.neerg
.TL
Lecture 5
.LP
We begin our descent into assembly language :D
.green
.SH
Assembly Language Specifics
.neerg

.LP
The MIPS architecture is simple, so we will use it
.bullet
compare to ARM 8 (smartphones), x86
.bullet
MIPS is still used in some embedded systems (e.g. routers)
.bullet
RISC type architecture (reduced instruction set computer)
.bullet
.B RISC
- ideology, smaller set of simpler insitructions
.bullet
ARM is a newer example of RISC

.LP
.B Architecture
- Specifies hardware (specifications that must be obeyed), and CPU instruction set
.RS
.bullet
Each instruction set has a corresponding assembly language

.RE
.LP
.bullet
We will use a MIPS simulator/emulator to simulate a MIPS computer (specifically, MARS)
.bullet
Architectures are of a certain size -- e.g. 32bit, 64bit, ...
.RS
.bullet
This bit value is the natural unit of data used by the processor, and we call this unit a
.B word
.bullet
Every register is 1 word wide, all data channels are 1 word wide, and so on
.RE

.bullet
Assembly language instructions are mnemonics for CPU instructions (which are in binary)
.RS
.bullet
The exception being pseudoinstructions, which don't have a direct mapping to CPU instructions
.RE

.bullet
All data manipulations happen from CPU registers
.RS
.bullet
Small/fast memory, built into the CPU.
.bullet
As MIPS is 32-bit, there are 32 registers
.bullet
Registers are split into categories: general purpose registers (
.CW "a0 - a3, s0 - s7, ..."
), special registers (program counters, instruction register, etc, which we don't touch directly)
.bullet
They're all the same from the hardware point of view, but we make additional agreements about how we treat them (e.g. t registers vs s registers)
.RE

.bullet
.UL "Example instruction"
.RS
.bullet
c = a + b
.bullet
ADD c, a, b
.bullet
ADD $s5, $s0, $s1
.bullet
ADD
.I destination
,
.I num1
,
.I num2
.RE

.LP
[diagram of RAM memory, separated into blocks, each 1 byte large]

.bullet
We can load more than 1 byte from memory at a time without any compromise of speed, since our data channels are wide enough to fit multiple bytes (4 in 32bit architectures)

.bullet
Simplest load instruction (to load data from memory) is LW (load word)
.RS
.bullet
LW
.I destination
,
.I "Memory Address"
.bullet
The second field is a problem (writing the memory address directly), because memory addresses are 32 bits long (too much to write out, and it won't fit in the instruction call, which itself is 32 bits long)
.bullet
Solution: indirect addressing
.RS
.bullet
LW
.I $t3
,
.I "Register w/ Memory Address"
.bullet
Put memory address in register
.bullet
Add offset to memory address
.bullet
LW
.I $t3
,
.I "∅($s7)"
.bullet
"That many bytes from the address in $s7"
.bullet
Lends itself well to arrays
.RE
.RE
.green
.SH 
Aliasing
.neerg

.bullet
When loading data, there are certain rules that must be followed (this is to simplify computer architecture)
.bullet
4 byte large data must begin at addresses that are divisible by 4, 2 byte large data must begin at addresses that are divisible by 2, and so on.
.RS
.bullet
E.g. you can't LW into address
.I 1
, but you can into address
.I 0
or
.I 4
.RE

.bullet
A consequence of this is that sometimes you may have to introduce "padding" between data in order to maintain aliasing rules
.RS
.bullet
meaning, if you load 2 bytes into register
.I 0
, and then decide to load 4 bytes, you'd have to start is at register
.I 4.
This means you're filling addresses
.I 0
and
.I 1
, leaving addresses
.I 2
and
.I 3
empty, and then filling addresses 4 - 7 (inclusive)
.RE

.bullet
Aliasing rules apply to C++ as well
.RS
.bullet
The compiler would probably optimize your bad decisions away, but for the sake of example:
.bullet
.CW "struct s1 {			struct s2 {"

.CW "	char c;				int i;"

.CW "	int i;				short s;"

.CW "	short s; };			char c; };"

.bullet
Struct s1 ends up taking 10 bytes (1 + 3 + 4 + 2), while struct s2 takes up 7 bytes (4 + 2 + 1), due to accounting for aliasing. In struct s1, after
.I "char c"
is declared, there are 3 bytes padded out before
.I "int i"
is loaded into memory, because its memory address must be a multiple of 4.
.RE

.S
.green
Some assembly instructions
.neerg

.bullet
LW - load word
.bullet
LH - load half word
.bullet
LB - load byte
.bullet
SW - store word
.RS
.bullet
SW
.I "register (take from)"
,
.I "memory (store at)"
.bullet
SW
.I $t3
,
.I "4($s7)
.RE

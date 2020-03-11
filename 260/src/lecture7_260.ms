.so ../../macros
.DA
.green
.AU
CS260, Computer Architecture II
.neerg
.TL
Lecture 7
.QP
On the structure of instructions -- how the 32 bits per each instruction are portioned into sections, and what each of those sections means. On different types of instructions -- R-type, I-type, and J-type.

.LP
.bullet
Each instruction in MIPS is 32 bits long

.CW "        32"
.TS
tab(;) allbox;
c.     
                                    ;
.TE

.I "Below is one type of instruction, called an R-type instruction"

.CW "   6     5     5     5     5     6"
.TS
tab(;) allbox;
c;c;c;c;c;c.
opcode;rs    ;rt    ;rd    ;shamt;function;
.TE

.I "An R-type instruction is so called because the data values used are located in registers"

.I "rd - register destination, rs - register source, rt - register target"

.bullet
In memory, the bits are still stored in 8 bit blocks, but this is how we organize the bits by their semantic meanings
.LP
.bullet
6 leftmost bits are the 
.B opcode
.RS
.bullet
The opcode tells us what operation will be performed
.bullet
e.g. opcode for addition is
.I 0
.RE

.bullet
We also have a section at the front specifying more information called the 
.B "function"
field -- there are many instructions that share the same opcode, but they are differentiated by the bits in the
.I function
field.
.RS
.bullet
e.g. ADD, SUB, MULT, all have an opcode of 0, but different function fields
.RE

.bullet
Example R-type instruction:

.CW "ADD $s0, $s0, $t0"

.CW "    rd    rs   rt"

.bullet
When assembling, register names are converted to their corresponding "number" (each has one, as specified by the architecture -- e.g. $s0 - $s8 are 16 - 23), and these numbers are stored as bits in the 
.I "rd/rs/rt" 
fields.

.KS
.bullet
You can also store each byte as hexadecimal, for convenience.
.RS
.bullet
Hexadecimal is commonplace because it's very simple to convert between it and binary -- simply group each 4 bits together and convert them to a hexadecimal digit (0 - F), and voila.
.RE
.KE
.PS
line;line;line;line;line;line;line;
.PE
.I "Below is another type of instruction, called an I-type instruction"

.CW "   6     5     5          16"
.TS
tab(;) allbox;
c;c;c;c.
opcode;rs    ;rt    ;         immediate        ;
.TE

.I "An I-type instruction is so called because the data values used are immediate values"

.bullet
Immediate - a piece of data that is stored as part of the instruction itself instead of being in a memory location or a register. Immediate values are typically used in instructions that load a value or performs an arithmetic or a logical operation on a constant

.bullet
An example I-type instruction is as follows:

.CW "ADDI $s3, $zero, 4"

.bullet
Note that the immediate value can be written in decimal, hexadecimal, binary, or any other format the assembler accepts (they will all be converted to binary upon assembling)
.bullet
Also note that the immediate value is stored in two's complement notation

.I "Another slightly different-looking I-type intruction is:"

.CW "LW $s3, 4($s7)"

.I "'4' here is a 16-bit signed integer offset

.I "A MIPS instruction is 32 bits (always). A MIPS memory address is 32 bits (always). How can a load or store instruction specify an address that is the same size as itself?"

.I "An instruction that refers to memory uses a base register and an offset. The base register is a general purpose register that contains a 32-bit address. The offset is a 16-bit signed integer contained in the instruction. The sum of the address in the base register with the (sign-extended) offset forms the memory address."

.PS
line;line;line;line;line;line;line;
.PE
.I "The last type of instruction is called an J-type (jump) instruction"

.CW "   6           26"
.TS
tab(;) allbox;
c;c.
opcode;          address            ;
.TE

.bullet
Examples of J-type instructions include
.I "J" 
(which is used in loops) and
.I "JAL" 
(which is used to implement functions)

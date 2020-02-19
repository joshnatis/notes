.so ../../macros
.DA
.green
.AU
CS260, Computer Architecture II
.neerg
.TL
Lecture 3
.QP
In this lecture we discussed why the clock rate of a computer
doesn't necessarily correspond to its speed. We also looked at
ways we can compare/discuss the performances of multiple computers,
culminating in benchmarking and practice problems on performance from
the textbook.
.green
.SH
Why does a clock rate not correspond directly to the speed of a computer?
.neerg

.bullet
Computers can increase the clock rate at high loads (dynamic clock speed adjustments)
.RS
.bullet
Only temporarily, though, cause the CPU can overheat
.bullet
Base clock speed / base frequency is the default speed
.RE

.bullet
The existence of multicore CPUs (multiple CPUs/processors in one)
.RS
.bullet
e.g.
.CW "8 * 2.3 GHz > 3 * 3.6 GHz"
.bullet
Note: The system is
.I potentially
more powerful, but many programs only utilize 1 core, so realistically a program might run fatser on the latter computer.
.RE

.bullet
The same instruction set on different CPUs may be implemented different in hardware (architecture implementations)

.RS
.UL Example
.LP
.RS
.CW "Comp A: 2 GHz, 1 cycles per instruction (CPI)"

.CW "Comp B: 3 GHz, 3 cycles per instruction"

.I "Comp A executes 2 billion instructions per second, Comp B executes only 1 billion instructions per second. Comp A is faster despite having a slower clock rate (this could be due to architecture implementation differences)"
.RE
.RE

.bullet
Other parts of the computer exist besides the CPU
.RS
.bullet
RAM (a bottleneck)
.bullet
If the RAM sucks, that significantly affects the operation of the computer system (constant memory stalls)
.RE

.LP
.B Takeaway:
No single piece of information can define/describe the computer, all aspects/components affect performance





.green
.SH
How can we compare?
.neerg

.B Benchmarks
.bullet
consists of test program(s) to execute
.bullet
compare benchmark performance between multiple computers
.bullet
downsides: some computers have parts specialized for certain benchmarks, so you may not get an accurate result (solution: use many varied benchmarks)
.green
.SH
Some formulas and definitions
.neerg

.EQ L
CYCLES = TIME~ (seconds) times FREQUENCY~ (Hz)
.EN
.EQ L
PERFORMANCE = {1} over {EXECUTION~TIME}
.EN
.RS
.bullet
Execution time is the pure time spent executing a program (assuming no interruptions)"
.bullet
You can measure this time in either seconds or cycles"
.RE

.EQ L
EXECUTION~TIME = #~INSTRUCTIONS times CPI times CLOCK~CYCLE~TIME = {#~INSTRUCTIONS times CPI} over FREQUENCY
.EN
.EQ L
CLOCK~CYCLE~TIME = 1 over FREQUENCY
.EN

.UL CPI
- Cycles per Instruction
.RS
.bullet
The average number of clock cycles per instruction for a program
.bullet
Each instruction takes integer number of cycles, but on average it can be a floating point
.bullet
The CPI can be < 1 (e.g. 0.5) if multiple cores of a CPU execute multiple instructions in one cycle
.RE

.UL "Dynamic instruction count"
- number of instructions a program has, dynamic meaning that loops and etc are taken into account

.green
.SH
.KS
Textbook Performance Problems
.neerg
.L
.SH
Example 1
.LP
.UL "Page 34"

Our favorite program runs in 10 seconds on computer A, which has a 2 GHz clock. We are trying to help a computer designer build a computer, B, which will run this program in 6 seconds.  The designer has determined that a substantial increase in the clock rate is possible, but this increase will affect the rest of the CPU design, causing computer B to require 1.2 times as many clock cycles as computer A for this program. What clock rate should we tell the designer to target?
.TS
tab(;) allbox;
c;c;c.
; Computer A; Computer B 
TIME; 10 seconds; 6 seconds
FREQ; 2 GHz; ?
CYCLES; ? ; ? 
.TE

.UL STEPS
.nr step 1 1 \"numbered list
.IP \n[step] 4
Count cycles for A ( 
.B "2 GHz x 10 seconds = 20 billion cycles"
)
.IP \n+[step]
Using this info, get the number of cycles for B. We're told that Computer B will require 1.2x more clock cycles than computer A. 
.B "20 billion x 1.2 = 24 billion cycles".
.IP \n+[step]
Plug in to 
.B "CYCLES = TIME x FREQ"

.B "24 billion cycles = 6 seconds x ? GHz = 6 seconds x 4 GHz"
(giga = billion)
.IP \n+[step]
The designer should aim for a frequency of 
.BX "4 GHz"
.KE
.SH

Example 2
.LP
.TS
tab(;) allbox;
c;c;c.
Processor; A; B 
CPI; 2; 2.5
.TE

Program X - dynamic instruction count of 1 billion

Program X runs on processor B, how many cycles does it take to execute?
.EQ L
{1~billion~instructions} times {2.5}~cycles over instructions = 2.5~billion~cycles
.EN

.KS
.SH
Example 3
.LP
.TS
tab(;) allbox;
c;c;c.
Instruction Type; A; B 
Cycles Per Instruction; 2; 3
.TE
.LP
Program X: 
.bullet
65% instructions of type A
.bullet
35% instructions of type B

Find the CPI:

(0.65 * 2) + (0.35 * 3) = 1.3 + 1.05 = 2.35

Alternatively, imagine there are 100 instructions. Then, 65 are of type A, and 35 are of type B. Type A instructions will take 65 * 2, or 130 cycles in total, and type B instructions will take 35 * 3, or 105 cycles in total. So, for a 100 instructions there will be 130 + 105, or 235 cycles used. Per each instruction, simply divide total cycles by the amount of instructions -- 235 / 100 = 2.35.
.KE

.so ../../macros
.DA
.green
.AU
CS260, Computer Architecture II
.neerg
.TL
Lecture 2
.QP
This session was spent reviewing the basic components of computers and their
relation to one another (as well as their relation to computer programs).
Specifically, we discussed the CPU, RAM, Storage Devices, and the Clock. We also
discussed the concept of a 'machine cycle'.
.green
.SH
Machine Cycle
.neerg
.bullet \"bulleted list (custom macro)
The CPU executes instructions.
.bullet
A
.UL "Machine Cycle"
is the sequence of steps that the CPU takes to execute one instruction

.RS \"indent
.RS
.nr step 1 1 \"numbered list
.IP \n[step] 4
FETCH
.IP \n+[step]
DECODE
.IP \n+[step]
EXECUTE
.IP \n+[step]
WRITE BACK
.RE
.RE

.bullet
.I "Fetch - copy the command to the CPU"

.I "Decode - understand what to do with the command"

.I "Execute - execute the command"

.I "Write back - take results and put them back where they should be"

.green
.SH
RAM 
.neerg
.bullet
Random-access Memory
.bullet
Everything used by the CPU has to be loaded into RAM first:

.RS
.bullet
Programs (set of instructions for CPU to execute). Each instruction is
fetched from RAM to the CPU.
.bullet
Data (text, images, etc)
.bullet
etc, literally anything, the CPU does not interface with the hard drive (can't get data directly from it)
.RE

.bullet
.UL Volatile
- data is lost when the power is lost
.bullet
Slow compared to the CPU, extremely fast compared to storage devices
.bullet
.UL "Memory Stall"
- CPU halts to wait for data from RAM (due to speed differences)
.KS \"keep content together, i.e. move to next page if necessary
.green
.SH
Storage Device
.neerg

.bullet
"Storage Device" is the general term for hard disks/solid state drives and so on
.bullet
Stores data (in files)
.RS
.bullet
Program files are called executable files
.RE
.bullet
Can't fetch commands from the hard disk
.bullet
Nothing can be displayed/ran/edited/etc in hard disk, only in RAM
.bullet
Orders of magnitude slower than RAM
.bullet
Maintains state even after power-off
.KE

.green
.SH
CPU
.neerg

.bullet
Central Processing Unit
.bullet
Executes instructions as defined by its logic components / wiring
.bullet
Every CPU architecture has its own
.UL "CPU instruction set"
, which is the set of instructions the CPU natively understands
.bullet
Only understands machine language (binary), but at some point people
thought of mapping human readable 'mnemonic' commands to each machine instruction

.RS
.bullet
As time went on, more and more was abstracted, leading to higher level
assembly instructions that corresponded to multiple machine instructions
(as opposed to a one-to-one relationship), and eventually modern
so-called high level programming languages which completely obscure
the underlying computer architecture.
.RE

.green
.SH
Clock
.neerg

.bullet
Synchronization device
.bullet
In order to keep the different computer components organized and in sync,
there exists a 'clock'
.bullet
The clock releases electric pulses at a certain predefined pace
(#pulses / second)
.RS
.bullet
The clock is to the computer as a drummer is to a band
.RE
.bullet
Measured in Hertz (Hz), e.g. 2.5 gHz is 2.5 billion pulses per second.
.bullet
Each pulse of the clock ushers in one machine cycle
.bullet
This means that, in theory, a faster clock results in a faster computer.
.bullet
The clock can only be as fast as the slowest component in the computer
(otherwise that component can't keep up, and all will be out of sync)

.green
.SH
 Note
.neerg
.LP
.I "Shostak asserts that a program written in assembly can outperform a modern compiler (with a high level language). Hopefully he provides some sort of example or further information next class."

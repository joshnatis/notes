.so ../../macros
.DA
.oval
.TL
Lecture 1
.green
.AI
CS 265 - Computer Theory
.SH
chapter 1 - discrete math review
.neerg
.LP
.IP \[bu]
graph theory
.IP \[bu]
set theory
.green
.SH
chapter 2 - Deterministic finite Automata (DFA)
.neerg
.LP
.IP \[bu]
feed machine an input string, it gives back an output string
.IP \[bu]
accept state (double circle)
.IP \[bu]
if im not there, the machine rejects the input string

.UL applications
.IP \[bu]
represent gates
.IP \[bu]
lexical analysis
.green
.SH
chapter 3 - regular expressions
.neerg
.LP
.IP \[bu]
strings that expand to a set of strings
.IP \[bu]
operators: or |, concatenation . , star *
.IP \[bu]
a | b --> {a, b}
.IP \[bu]
a . b --> {ab}
.IP \[bu]
a* --> {empty string, a, aa, aaa, ...}
.green
.SH
chapter 4
.neerg
.green
.SH
chapter 5 - context free grammars
.neerg
.LP
e is the empty string (length 0)
.IP \[bu]
S --> AB
.IP \[bu]
A --> Aa | e
.IP \[bu]
B --> Bb | e
.IP \[bu]
start symbol
.IP \[bu]
parse string
.IP \[bu]
production rules
.IP \[bu]
S --> AB --> ABb --> Bb --> b
.IP \[bu]
accepts any string such that you can derive the string from the start symbol
.IP \[bu]
used in parser
.green
.KS
.SH
chapter 6 - pushdown automata
.neerg
.LP
.IP \[bu]
finite state machine with a stack
.IP \[bu]
transition states based on input and store memory
.green
.SH
.KE
chapter 7 - turing machines 
.neerg
.LP
.UL 'hardware'
.IP \[bu]
tape
.IP \[bu]
input string on tape
.IP \[bu]
infinite tape
.IP \[bu]
read/write head

.LP
.UL 'software'
.IP \[bu]
transition function
.IP \[bu]
set of rules i have to follow to move across this tape
.IP \[bu]
transition function gets complex (can represent any algo)

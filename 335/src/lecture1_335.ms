.DA
.AU 
CS335, Algorithms
.TL 
Lecture 1

.QP
New topics include the
.CW explicit
keyword, the
.CW IntCell
class, initialization with brackets {}, range loops, lvalues, and rvalues.
As for style, functions and classes follow CamelCase, variables follow snake_case

.SH
IntCell class
.LP
Just holds an int (accessor and setter)

.UL "Proper ways to construct:"

.IP \[bu]
.CW "IntCell obj1;"
.IP \[bu]
.CW "IntCell obj2(12);"
.IP \[bu]
.CW "IntCell obj3{12};" 
.IP \[bu]
.CW "IntCell obj4{};"

.SH
Vector Initialization
.IP \[bu]
.CW "vector<int> n = {1, 2, 4, 4};"
.IP \[bu]
.CW "vector<int> n {1, 2, 3, 4};"
.IP \[bu]
.CW "vector<int> n(12); -- empty vector of size 12"
.IP \[bu]
.CW "vector<int> n{12}; -- vector containing element 12"

.SH
Range based For loops

.CW "vector<float> f = {1.1, 10.2, 3, 20.31};"

.CW "float sum = 0;"

.CW "for (float x: f)"

.CW "	sum += x;"

.IP \[bu]
x cannot be modified (it's a copy)

.SH
lvalues and rvalues

.IP \[bu]
lvalues are containers, rvalues are things that are contained
.IP \[bu]
lvalues point to a specific place in memory, rvalues may be stored in a register temporarily but otherwise are not stored
.IP \[bu]
lvalues are typically the declaration/variable on the lefthand side, while rvaues are typically expressions/literals on the righthand side

.LP
.UL examples

lvalues

.IP \[bu]
.CW "const int x;"
.IP \[bu]
.CW "int y;"
.IP \[bu]
.CW "vector<string> arr(3);

.LP
rvalues
.IP \[bu]
.CW 2
.IP \[bu]
.CW "x + y"
.IP \[bu]
.CW "'foo'

.so ../../macros
.DA
.green
.AU
CS260, Computer Architecture II
.neerg
.TL
Lecture 4
.QP
This lecture was a bit of a side-step from the regular material -- we primarily discussed power consumption in the context of computers. 
.green
.SH
Some hardware history
.neerg
.LP
.bullet
vacuum tubes
.RS
.bullet
automatic switch for completing/breaking electron flow
.bullet
big enough to change with your hands if the tube burns out
.RE

[diagram of vaccum tube]

.bullet
battery
.RS
.bullet
Modern computing started when we found a way to close a circuit NOT manually (able to automate it using electric currents)
.RE

[diagram of battery]

.bullet
transistor
.RS
.bullet
does not deal well with heat (stops isolating electricy if it gets hot enough)
.bullet
current on/off
.bullet
micro
.RE

[diagram of transistor]

.green
.SH
Power Consumption/Power Wall
.neerg

.bullet
The power wall is a major factor in why we can't make our CPUs faster and faster
.RS
.bullet
Before, making CPU faster was a matter of increasing frequency (fastest we got to was 5 GHz)
.bullet
Problem: each cycle has an electrical cost. Electricity heats up your wire with the energy lost during transfer
.bullet
More GHz --> hotter
.bullet
Remember: the transistor can only get so hot before it starts malfunctioning and leaking electricity
.bullet
Solution 1: Heat sink, a piece of copper/metal that easily transfers heat, placed on top of the CPU to disseminate as much heat as possible
.bullet
Solution 2: cooler (fans, cooling units, etc)
.bullet
Solution 3: Drop frequency when CPU gets too hot (modern CPUs do this)

.bullet
Problem: Cannot cool modern CPUs sufficiently, so, how do we not heat them in the first place?
.RS
.bullet
Solution 1: Decrease voltage (less electricity to the CPU --> less heat)
.bullet
Problem: at too low voltage, transistors leak through through the closed circuit
.bullet
Leakage is always there, but it becomes too significant at low enough voltage (hard to tell between 0 and 1)
.RE
.RE

.B Takeaway:
Modern engineers are trapped between these two walls: high frequency (overheating) and low voltage (leakage)

.bullet
Other walls: memory wall (RAM is so slow, doesn't matter how fast CPU is)

.LP
.I "Miscellaneous note: military computers have very bad specifications sometimes (low frequency, etc.) because they want the computers to function in a large range of conditions/temperatures"

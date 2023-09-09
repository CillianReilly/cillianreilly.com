// kdb+ built in host line separator
// often neccesary to delimit strings by the operating systems seperator
// unix: \n
// windows: \r\n

s:$[.z.o like"l*";"\n";.z.o like"w*";"\r\n";""]         // boring
s sv("line 1";"line 2")

// sv and vs have overloads for this
// join
` sv("line 1";"line 2")

// split
` vs` sv("line 1";"line 2")

// right arg must be strings
// ` sv("line 1";"2")                                   // type error

// faster
\ts:100000 ` sv("line 1";"line 2")
\ts:100000 $[.z.o like"l*";"\n";.z.o like"w*";"\r\n";""] sv("line 1";"line 2")

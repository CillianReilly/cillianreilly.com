// repeated application

// typically done using over and scan
// contrived example x^y (use xexp)
// scan to show intermediate steps

ps:{(y-1)(x*)\x}
ps[2;4]
ps[2;10]
ps[5;3]

// to apply selectively to sub entries, use @ amend
d:`a`b`c!2 3 5f
po:{(y-1)(x*)/x}
@[d;`a;po[;4]]
@[d;`a;po[;10]]
@[d;`c;po[;3]]

// there is another method
// https://code.kx.com/q/ref/amend/#amend-at
// repeated indices are accumulated

@[d;3#`a;2*]
@[d;9#`a;2*]
@[d;2#`c;5*]

f1:{@[x;y;{(y-1)(x*)/x}[;z]]}
f2:{@[x;(z-1)#y;x[y]*]}

(~/)(f1;f2).\:(d;`a;4)
(~/)(f1;f2).\:(d;`a;10)
(~/)(f1;f2).\:(d;`c;3)

// useful for dictionary/table contexts
// though performance is slightly worse (memory usage is the same)
\ts:100000 f1[d;`a;4]
\ts:100000 f2[d;`a;4]

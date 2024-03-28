// rank of a function is the number of arguments it takes
// https://code.kx.com/q/basics/glossary/#rank
// in general, rank is fixed, but there is a way around this

// enlist can take any number of parameters
enlist[1]
enlist[1;4;10]

// even 8+ - the maximum for other functions is 8
enlist[1;2;3;4;5;6;7;8;9]

// composing enlist with a second function allows us to take advantage of this fact
s:sum enlist::
s[1]
s[1;4;10]

// can't use @ or . to create the composition as they are fixed rank of 1
// (sum enlist@)[1;2] signals 'rank
// (sum enlist .)[1;2] signals 'rank

// the canonical method for compose https://code.kx.com/q/ref/compose/
s:('[sum;enlist])
s[1]
s[1;4;10]
'[sum;enlist]~(sum enlist::)


// having said the above: https://www.youtube.com/watch?v=g3j9muCo4o0
// yet to see a case where this is neccesary
// kdb+ already offers such functionality
// use a list
sum 1
sum 1 4 10

// use a list for ordered arguments or a dictionary for un-ordered arguments
// https://en.wikipedia.org/wiki/KISS_principle

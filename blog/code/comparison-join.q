// comparison join
.q.show:{-1 .Q.s x;}
show y:([]sym:`TSLA`IBM`MSFT;price:10f,2?100f)
show z:([sym:`TSLA`IBM`MSFT`GOOG];price:10f,3?100f)

// x is comparision operator
// y is a table
// z is a keyed table, whose key column(s) are columns of x
// returns an entry for each record in table y
cj:{x[k xkey y;]((k:keys z)#0!y)#z}

// x=y // 'length error
// (0!y)=1 rotate -1_x // also requires the correct ordering
show cj[=;y;z]

// first param is an arbitrary binary function
// average, median
show cj[{avg(x;y)};y;z]
show cj[{med(x;y)};y;z]
// absolute percentage difference
show cj[{abs 1-x%y};y;z]


// generalises lj and pj (slower)
lj[y;z]~0!cj[,;y;z]
pj[y;z]~0!cj[+;y;z]

\ts:100000 pj[y;z]
\ts:100000 cj[+;y;z]
\ts:100000 lj[y;z]
\ts:100000 cj[,;y;z]


// can also be defined to return a record for all rows in both tables
cja:{x[;z]keys[z]xkey y}

show cja[=;y;z]
show cja[+;y;z]

// including all rows can lead to nonsense results depending on x
show cja[{abs 1-x%y};y;z]

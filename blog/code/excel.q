// working with .xls files
trade:([]time:.z.p+til 5;sym:5?`TSLA`IBM`NVDA;price:5?100f;size:5?10f)
quote:([]time:.z.p+til 5;sym:5?`TSLA`IBM`NVDA;ask:5?100f;bid:5?100f;askSize:5?10f;bidSize:5?10f)

// simple tables use .h.ed
// this hardcodes the sheet name as first parameter to .h.es
.h.ed trade
.h.ed quote
.h.ed

// for dynamic sheet names pass a dictionary of sheet name!data to .h.edsn
.h.edsn enlist[`trade]!enlist trade
.h.edsn enlist[`quote]!enlist quote

// this includes the ability to write several sheets to one .xls
.h.edsn{x!value each x}tables[]

// the http the handler uses .h.tx`xls
.h.tx`xls
.h.ed~.h.tx`xls

// result of the http query must be a table
// and the output will have a single sheet named Sheet1

// to return more dynamic xls files via the http server
// we can overwrite the behaviour of .h.tx`xls
// .h.tx.xls{x!value each x}tables[] // type error as data is not a table

\d .h
tx.xls:{$[98h=type x;ed;edsn]x}
\d .

.h.tx.xls trade
.h.tx.xls{x!value each x}tables[]

// start server
\p 5001
// http://localhost:5001/trade.xls?trade
// http://localhost:5001/quote.xls?quote
// http://localhost:5001/tables.xls?{x!value each x}tables[]

// or from another kdb+ process
// .Q.hg hsym`$"http://localhost:5001/trade.xls?trade"

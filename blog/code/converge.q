// additional convergence
// halts when the next step has already been produced
// e.g. (not/)42 gets stuck in a loop of 0b > 1b > 0b

// uses while syntax to determine convergence
// https://code.kx.com/q/ref/accumulators/#while
// at each intermediary step, the result is checked against the list of previous results

converge:{[f;x]
  cond:{not last[x]in -1_(),x};
  -1_{[f;x]x,f last x}[f;]/[cond;x]
  }

// return value is all results (similar to scan)
converge[not;42]

// last mimics the behaviour of over
last converge[not;42]

// of course, slower than built in convergence for regular cases
\ts:100000 (not\)0b
\ts:100000 converge[not;0b]

\ts:100000 {(x+x)mod 13}\[2]
\ts:100000 converge[{(x+x)mod 13};2]

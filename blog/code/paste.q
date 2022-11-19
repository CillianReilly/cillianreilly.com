// Multi-line paste into the kdb+ console

paste:{
	value							// evaluate gathered input
	{$[(""~r:read0 0)and not sum 124-7h$x inter"{}";	// read input, check current function count
		x;						// return gathered input, halt convergence
		x,` sv enlist r]				// append latest input, host line separator
		}/[""]						// converge, initial state
	}

// {value{x,read0 0}/[""]}					// no comments or blank lines in input
// k){.{x,0::0}/[""]}

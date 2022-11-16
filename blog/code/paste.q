// Multi-line paste into the kdb+ console

paste:{
	value						// evaluate gathered input
	({
		$[(""~r:read0 0)and not x;		// read input, check current function count
			(x;"");				// return initial state, halt convergence
			(x+/124-7h$"{}"inter r;		// increment/decrement function count
			y,` sv enlist r)		// append latest input, host line separator
			]
		}.)/					// apply to 2 item initial state and converge
		[(0;"")]				// initial state
	}

// {value{x,read0 0}/[""]}				// no comments or blank lines in input
// k){.{x,0::0}/[""]}

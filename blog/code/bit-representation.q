// bit representation

0b vs/:4 5 6 7h$100		// bit representation of byte(8), short(16), int(32), long(64)
0b sv/:0b vs/:4 5 6 7h$100	// sv is still the dual of vs

0b sv 64#0b			// all zero boolean list is zero
0b sv 64?0b			// random long value
0b sv 64#1b			// largest long - an unusual result
0b sv (63#1b),0b		// one bit less - still unexpected

// sign of the long is determined by the first bit. 0b positive, 1b negative
0b sv 0b,63#1b			// largest long? close
0b sv 0b,(62#1b),0b		// one bit less gives us what we want
1+0b sv 0b,(62#1b),0b		// can't describe larger

0b sv 1b,63#0b			// null of type long, single left most bit

0b sv 1b,(62#0b),1b		// negative infinity
0b sv 1b,(61#0b),10b		// smallest long
-1+0b sv 1b,(61#0b),10b		// cant' describe smaller

1_(>':)0N -0W -9223372036854775806 -2 -1 0 1 2 9223372036854775806 0W			// increasing longs
any each 1_(>':)0b vs/:0N -0W -9223372036854775806 -2 -1 0 1 2 9223372036854775806 0W	// non-increasing bits
any each 1_(>':)0b vs/:0 1 2 9223372036854775806 0W 0N -0W -9223372036854775806 -2 -1	// increasing bitwise
0b vs/:0 1 2 9223372036854775806 0W 0N -0W -9223372036854775806 -2 -1

// this can be explained by -1+1, which wraps all bits back to false, as we are limited to 64 bits
// 0b sv 128#0b			// 'length

// handles are integers, kdb+ displays underlying int value in errors
0b vs/:(0Ni;0Wi)		// converting this to int outside kdb+ gives the int values below
// 0N"2+2" 			// 'Cannot write to handle -2147483648. OS reports: Bad file descriptor
// 0W"2+2"			// 'Cannot write to handle 2147483647. OS reports: Bad file descriptor

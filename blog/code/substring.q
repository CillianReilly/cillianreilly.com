// lengths of contiguous substrings

show l:20?0b
count each(where differ l)cut l       		// long-winded
1_deltas where differ[l],1b			// shorter

\ts:100000 count each(where differ l)cut l
\ts:100000 1_deltas where differ[l],1b		// and faster

ccs:1_deltas where,[;1b]differ::
ccs 0N!20?0b					// boolean
ccs 0N!20?2					// long
ccs 0N!20?"abc"					// char

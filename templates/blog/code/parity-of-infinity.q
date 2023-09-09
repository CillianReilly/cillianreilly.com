// https://news.ycombinator.com/item?id=35787287
// is infinity even or odd?

0W mod 2                // q says odd

// The implementation of mod is {x-y*x div y}
0W div 2                // q says infinity is 1+9223372036854775806

// Using https://cillianreilly.com/blog/bit-representation.q,
// we recognise 9223372036854775806 as the largest long in kdb+
// So kdb+ maps 9223372036854775807 to infinity, keeping the parity of 1

// bit-wise 0N=1+0W, so this is expected
0N div 2
0N mod 2                // 0N*0=0N

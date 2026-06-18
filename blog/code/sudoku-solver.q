// i had been meaning for a long time to write my own sudoku solver, putting it off anticipating that it would be difficult
// after https://cillianreilly.com/blog/etihads-unsolvable-sudokus, i gave in and looked at the kx solver (originally arthur whitney's)
// https://github.com/KxSystems/kdb/blob/master/sudoku.k
// https://nsl.com/k/sudoku
// and after all this time, it turns out to be just brute force

// input
x:value each"200370009009200007001004002050000800008000900006000040900100500800007600400089001"

// k original
k)*(,x)(,/{@[x;y;:;]'&~in[!10]x*|/p[;y]=p,:3/:_(p:9\:!81)%3}')/&~x

// direct q translation
// k is nicer, it doesn't need the additional lambda wrapping the each both
first{raze{@[x;y;:;]each where not til[10]in x*(or/)p[;y]=p,:3 sv div[;3]p:9 vs til 81}'[x;y]}/[enlist x;where not x]


// piece by piece
// create a 3 element list of row, column and box
p,:3 sv div[;3]p:9 vs til 81

// blank spaces to be filled
b:where not x

// iteration is done over the list of blank spaces
// for each space, zero the elements not in the same row, column or box
e:x*(or/)p[;first b]=p

// find the candidates for that space
c:where not til[10]in e

// amend the original grid with each of the candidates at the index of the current space
@[x;first b;:;]each c;

// raze flattens the result of each iteration
// then move to the next blank space


// particularly nice bits
// 1. iteration stops once the last blank space is processed, no need for any conditionals
// 2. it's expected that each sudoku will have a unique solution, but for any that don't, dropping the first will return all results (see linked blog post above)
// 3. if there are no possible candidates for a space, c becomes an empty list `long$(). Amending the grid on each entry of this empty list does nothing, which returns (), which is removed by raze, again saving the need for any conditionals


// improvements
// 1. define p outside the iteration
// 2. define t outside the iteration
// 3. define the iteration as a function
// 4. replace (or/) with any
// 5. replace where not til with except

p,:3 sv div[;3]p:9 vs til 81
f:{[p;t;x;y]@[x;y;:;]each t except x*any p=p[;y]}[p;til 10]
s:{{raze f'[x;y]}/[enlist x;where not x]}

k)\ts *(,x)(,/{@[x;y;:;]'&~in[!10]x*|/p[;y]=p,:3/:_(p:9\:!81)%3}')/&~x
\ts first s x


// the unsolvable sudoku from https://cillianreilly.com/blog/etihads-unsolvable-sudokus
x:value each"000506087902010356000003149009000000000000000000000700598400000126050904340901000"
count s x

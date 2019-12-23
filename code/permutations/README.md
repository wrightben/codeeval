## Algorithms for generating permutations


### About this algorithm

The key to this algorithm is the idea that subtracting the distinct integers in any permutation from (n+1) yields a new permutation. This skips values not in the permutation set. This idea of working with only numbers in the set comes at the price of having to perform operations on n digits for each permutation.

#### Example:

```
	  5 5 5 5
	- 1 2 3 4
	= 4 3 2 1
	
	  4 4 4 4
	- 1 2 3 4
	= 3 2 1 4	
```




#### Performance

i.js is approximately as fast as the nested for-loops created by iter.pl up to n = 9.

```
$time node i.js 
{ '123456789': [
    0, 0, 0, 0, 0,
    0, 0, 0, 0, 0
  ], length: 1 }
1
10
81
612
3984
21786
92568
198140
143666
43838
362880

**real	0m4.403s**
user	0m4.436s
sys	0m0.139s
```

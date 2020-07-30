# Word Search Solver (JavaScript)


### Description

Word Search Solver

<br />

---
### Run the Code

[word search.js](https://github.com/wrightben/codeeval/blob/master/code/word%20search.js)

```sh
time node word\ search.js
```

<br />

---
### About My Solution

Finds words in square strings (n^2). Creates strings from an index in rows, cols, and diagonals. Performs word search on each string (forward and reverse). Optimizable using adjacent-row/col results.

See [word search output.js](https://github.com/wrightben/codeeval/blob/master/code/output/word%20search%20output.js) for example. 


RESULT MAP

```
"POS ( ROW , COL)":	[
				row, col, ld \, rd /, 
				row (R), col (R),  ld \ (R), rd / (R)
			],
```

POS[x] = "example".search("p") = 4, because .search is zero-based.

ld = \ = Diagonal from Top-Left to Bottom-Right <br />
rd = / = Diagonal from Bottom-Left to Top-Right <br />
(R) = Reverse string
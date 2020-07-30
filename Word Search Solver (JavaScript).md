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
				row, col, diag (+1), diag (-1), 
				row (R), col (R),  diag (R), diag (R)
			],
```


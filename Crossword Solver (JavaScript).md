# Crossword Solver (JavaScript)


### Description

25 x 25 Crossword with 34 words. Quickly find them.

<br />

---
### Run the Code

[crossword.js](https://github.com/wrightben/codeeval/blob/master/code/crossword.js)

```sh
time node crossword.js
```

<br />

---
### About My Solution

Finds words in square strings (n^2) using indexes. Seeks words in rows, cols, and diags; forward and backward. Optimizable using adjacent-row/col results.

See [crossword-output.js](https://github.com/wrightben/codeeval/blob/master/code/output/crossword-output.js) for example. 


RESULT MAP

```
"POS ( ROW , COL)":	[
				row, col, diag (from UL), diag (from LL), 
				row (R), col (R),  diag (R), diag (R)
			],
```


Note the meaning difference between forward-reverse when comparing row/cols to diags
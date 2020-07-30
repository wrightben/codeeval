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

Finds words in square strings (n^2). Creates substrings from rows, cols, and diagonals using an index. Performs word search on each string (forward and reverse). Optimizable using adjacent-row/col results.

See [word search output.js](https://github.com/wrightben/codeeval/blob/master/code/output/word%20search%20output.js) for example. 


#### RESULT MAP

```
"POS ( ROW , COL)":	[
				row, col, ld \, rd /, 
				row (R), col (R), ld \ (R), rd / (R)
			],
```

"POS ( ROW , COL)"[i] = "example".search("p") = 4, because .search is zero-based.

ld = \ = Diagonal from top-left to bottom-right <br />
rd = / = Diagonal from bottom-left to top-right <br />
(R) = Reverse string

#### ANOMALIES AND ERRATA

Unusual or interesting results happen when the following things are true:

* Duplicates: "Fun" occurs multiple times, or the word appears as a palindrome ("FunuF")
* Substrings: "Fun" and "Funny" are both included
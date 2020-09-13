# Sudoku
This will solve Sudoku.com puzzles, excluding the expert ones, which seem to require some guessing and/or have multiple solutions. This code can easily be modified to create and verify puzzles, too.


```
./sudoku_solver.pl  > ~/Desktop/sudoku_solver_output.txt 
```


## Summary

The file **permutations.txt** is the 9!-long list of permutations for 123456789, and **sudoku_solver.pl** requires it to solve a puzzle.

```
$time ./sudoku_solver.pl  > ~/Desktop/sudoku_solver_output.txt 

real	0m4.322s
```


#### Numbers to CSV.numbers
Use *Numbers to CSV.numbers* to "Copy Puzzle" from Sudoku.com, then copy-paste to **sudoku_solver.pl**.

```
4	.	.	9	.	.	8	6	.
.	.	.	.	.	7	2	.	.
.	3	.	2	5	.	.	.	.
.	1	7	.	.	5	.	2	9
.	9	.	.	.	6	.	.	.
.	6	.	.	.	.	.	7	.
.	.	.	4	.	.	5	.	.
7	.	.	.	.	.	9	.	.
.	.	.	.	6	2	4	.	.

# Glitch Warning: Missing .?
```

#### sudoku_solver_output.txt
- The puzzle in .tsv with the possible numbers for each cell.
- The regular expressions and permutations available for each box.

Modify the permutations for copy-paste into the .numbers file:
```
# Before
123456789;

# After
1	2	3
4	5	6
7	8	9
```


```
s/([\d])([\d])([\d])([\d])([\d])([\d])([\d])([\d])([\d]);[\t]?/\1\t\2\t\3\n\4\t\5\t\6\n\7\t\8\t\9\n\n/;
```


#### Calculating Permutations Manually

The **./permutations** folder includes **regex_builder.pl** and **unique_filter.pl**, which print a list of the available permutations for any row, col, or box copied-pasted from the Numbers file. It's a manual operation, which requires a copy-paste from *Numbers to CSV.numbers* into **regex_builder.pl**.

```
cat permutations.txt | grep -e "$(./permutations/regex_builder.pl)" | ./permutations/unique_filter.pl
```
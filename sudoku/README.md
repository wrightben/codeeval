## Sudoku
The 9 "small boxes" are entries from the 9!-length list of permutations for [1,2,3,4,5,6,7,8,9]. 


```
cat 2\ -\ sudoku.csv | ./sudoku\ solver.pl  > ~/Desktop/output.txt 
```


## Notes

File **sudoku solver.pl** uses **2 - sudoku.csv** and **1 - permutations.txt** to solve the puzzle.

#### 1 - permutations.txt
This is the printed list of permutations for 123456789. It's 362,880-lines long (9!). The file **1 - permutations.txt** is a filtered list of permutations that results by iteration 7 of the solver. There are only 192 remaining options for every row, box, and column<sup>*</sup>. 

<sup>*</sup> Some of 192 permutations are excluded by intersections, for example: Row 4 excludes several from the result of Box 4 in iteration 7.


#### 2 - sudoku.csv
Use *Numbers to CSV.numbers* to "Copy Puzzle" from Sudoku.com, then copy-paste to **2 - sudoku.csv**.

```
9	.	.	.	.	.	.	6	.
.	.	.	.	8	.	1	9	.
.	.	7	.	1	.	.	.	.
.	.	.	.	.	6	.	7	3
.	.	.	3	.	9	.	.	.
3	4	5	.	.	.	.	.	.
4	.	.	.	.	2	6	8	.
.	.	2	5	.	.	.	.	.
.	3	.	7	.	.	.	.	.

# Glitch Warning: Missing .?
```

#### 3 - output.txt
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


#### Manual Calculating

The **./permutations** folder includes **regex_builder.pl** and **unique_filter.pl** print a list of the available permutations for any row, col or box copied-pasted from the Numbers file. It's a manual operation.

```
cat 1\ -\ permutations.txt | grep -e "$(./permutations/regex_builder.pl)" | ./permutations/unique_filter.pl
```
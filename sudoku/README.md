## Sudoku
The 9 "small boxes" are entries from the 9!-length list of permutations for [1,2,3,4,5,6,7,8,9]. 


```
cat 2\ -\ sudoku.csv | ./sudoku\ solver.pl  > ~/Desktop/output.txt 
```


## Notes

File **sudoku solver.pl** uses **2 - sudoku.csv** and **1 - permutations.txt** to solve the puzzle.

#### 2 - sudoku.csv
Use *Numbers to CSV.numbers* to "Copy Puzzle" from Sudoku.com and copy/paste to **2 - sudoku.csv**.
```
# BBEdit Replace
s/\t/,/
s/\./_/
```

```
9,_,_,_,_,_,_,6,_
_,_,_,_,8,_,1,9,_
_,_,7,_,1,_,_,_,_
_,_,_,_,_,6,_,7,3
_,_,_,3,_,9,_,_,_
3,4,5,_,_,_,_,_,_
4,_,_,_,_,2,6,8,_
_,_,2,5,_,_,_,_,_
_,3,_,7,_,_,_,_,_

# Glitch Warning: s/(,,)|\s|./_/g!
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
s/\t//;
s/([\d])([\d])([\d])([\d])([\d])([\d])([\d])([\d])([\d])/\1\t\2\t\3\n\4\t\5\t\6\n\7\t\8\t\9\n\n/;
```
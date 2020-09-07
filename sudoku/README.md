## Sudoku
The 9 "small boxes" are entries from the 9!-length list of permutations for [1,2,3,4,5,6,7,8,9]. 




## Notes

File **sudoku solver.pl** uses **sudoku.csv** and **permutations.txt** to solve the puzzle. File **puzzle.tsv** was generated during coding as an intermediate step to verify the getPossible function.

#### sudoku.csv
Use *Numbers to CSV.numbers* to "Copy Puzzle" from Sudoku.com and copy/paste to sudoku.csv. Do: s/\t/,/; & s/\./_/;

```
9,_,_,_,_,_,_,6,_
_,_,_,_,8,_,1,9,_
_,_,7,_,1,_,_,_,_
_,_,_,_,_,6,_,7,3
_,_,_,3,_,9,_,_,_
3,4,5,_,_,,_,_,_
4,_,_,_,_,2,6,8,
_,_,2,5,_,_,_,_,_
_,3,_,7,_,_,_,_,_
```

#### puzzle.tsv
Output the puzzle with the possible numbers for each box

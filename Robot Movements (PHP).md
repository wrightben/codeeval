# Robot Movements (PHP)<br />
[www.CodeEval.com](https://web.archive.org/web/20150721085940/https://www.codeeval.com/public_sc/57/)<br />
Posted on October 16, 2011

## Description: 

A robot is located in the upper-left corner of a 4×4 grid. The robot can move either up, down, left, or right, but cannot go to the same location twice. The robot is trying to reach the lower-right corner of the grid. Your task is to find out the number of unique ways to reach the destination.

**Output sample:**

Print out the number of unique ways for the robot to reach its destination. The number should be printed out as an int >= 0. 

### My Solution:

The following chunk of code will print out the total successful variations for walking a grid one square at a time, when it has been declared that we begin in the upper-left square, that we are trying to reach the lower-right square, that we cannot move diagonally, and that we cannot revisit a square. The GridHelper object accepts an x bound (positive int), a y bound (positive int), a “force” attribute (positive int), and an option to print the paths as they’re found (true|false).

## Code

[robotMovements.php](https://github.com/wrightben/codeeval/blob/master/code/robotMovements.php)

#### Run the script
```sh
time php robotMovements.php
```
# Robot Movements (JavaScript)<br />
[www.CodeEval.com](https://web.archive.org/web/20150721085940/https://www.codeeval.com/public_sc/57/)<br />
Posted on October 16, 2011

## Description

A robot is located in the upper-left corner of a 4×4 grid. The robot can move either up, down, left, or right, but cannot go to the same location twice. The robot is trying to reach the lower-right corner of the grid. Your task is to find out the number of unique ways to reach the destination.

**Output sample:**

Print out the number of unique ways for the robot to reach its destination. The number should be printed out as an int >= 0. 

<br />

---
### Code

[robotMovements.js](https://github.com/wrightben/codeeval/blob/master/code/robotMovements.js)

#### About My Solution

getPaths( gridSize, limit, debug )
		
* gridSize(int): Arbitrarily large square
* limit(int): Num of failures to allow. Try 1500 for 4x4.
* debug(true|false): Print the paths as they’re found.

**Board Constraints**

Movements:

* Up/Down: 	-/+ gridSize
* Left/Right:	-/+ 1

Boundaries: (pos = current position; 1-based)

* Top:		(pos - gridSize) < 1
* Bottom:	(pos + gridSize) > Math.pow(gridSize, 2) // Or board.length
* Left:		pos - 1 % gridSize = 0
* Right:	pos % gridSize = 0

Invalid Moves:

* Off grid
* Visited


---
### Run the Code
```sh
time node robotMovements.js
```
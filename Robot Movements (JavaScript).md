# Robot Movements (JavaScript)<br />
[www.CodeEval.com](https://web.archive.org/web/20150721085940/https://www.codeeval.com/public_sc/57/)<br />
Thanksgiving 2018

## Description

A robot is located in the upper-left corner of a 4×4 grid. The robot can move either up, down, left, or right, but cannot go to the same location twice. The robot is trying to reach the lower-right corner of the grid. Your task is to find out the number of unique ways to reach the destination.

**Output sample:**

Print out the number of unique ways for the robot to reach its destination.

CodeEval's answer for a four-by-four grid:<br/>
```sh
184
```

<br />

---
### Code

[robotMovements.js](https://github.com/wrightben/codeeval/blob/master/code/robotMovements.js)

#### About My Solution

getPaths( gridSize, limit, debug )
		
* gridSize(int): Arbitrarily large square
* limit(int): Num of failures to allow. Try 1500 for 4x4.
* debug(true|false): Print the paths as they’re found.

<br />

In 2010, I created {Text}, a website for sharing regular expressions. The sharable urls contained both data and expressions. In December of 2012, I created BookmarkChess, a fully accessible (desktop, mobile), real-time chessboard that inspired the UX now delivered by sites like lichess.org and chess.com. BookmarkChess allowed for sharable chess experiences with the game state embedded in the url. I'm leveraging my experience with those sites when I shift from a grid metaphor (an array of arrays) into a linear metaphor (a single array).



---
### Run the Code
```sh
time node robotMovements.js
```
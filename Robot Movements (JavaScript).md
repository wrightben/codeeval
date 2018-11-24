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
## Run the Code

[robotMovements.js](https://github.com/wrightben/codeeval/blob/master/code/robotMovements.js)

```sh
time node robotMovements.js
```

<br />

---
### About My Solution

getPaths( gridSize, limit, debug )
		
* gridSize(int): Arbitrarily large square
* limit(int): Num of failures to allow. Try 1500 for 4x4.
* debug(true|false): Print the paths as they’re found.

<br />

[ Linear ]<br />
In 2010, I created {Text}, a website for sharing regular expressions. The sharable urls contained both data and expressions. In 2012-13, I created BookmarkChess, a fully accessible (desktop, mobile), real-time chessboard that inspired the UX now delivered by sites like lichess.org and chess.com. BookmarkChess allowed for sharable chess experiences with the game state embedded in the url. I'm leveraging that previous experience when I shift from a grid metaphor (an array of arrays) into a linear metaphor (a single array) to create a space for my robot.

[ Simple AI ]<br/>
Robot considers blocked paths. Robot chooses paths randomly, but can recognize when he's about to repeat a mistake. If Robot encounters a recognizable do-over scenario, it attempts to make a better choice.
# Robot Movements (JavaScript)
[https://www.codeeval.com/public_sc/56/](https://web.archive.org/web/20150721085940/https://www.codeeval.com/public_sc/56/)<br />

### Description

A robot is located in the upper-left corner of a 4×4 grid. The robot can move either up, down, left, or right, but cannot go to the same location twice. The robot is trying to reach the lower-right corner of the grid. Your task is to find out the number of unique ways to reach the destination.

**Output sample:**

Print out the number of unique ways for the robot to reach its destination.

CodeEval's answer for a four-by-four grid:<br/>
```sh
184
```

<br />

---
### Run the Code

[robotMovements.js](https://github.com/wrightben/codeeval/blob/master/code/robotMovements.js)

```sh
time node robotMovements.js
```

<br />

---
### About My Solution

getPaths( gridSize, debug )
		
* gridSize(int): Arbitrarily large square
* debug[ (true|false), (true|false) ]: Print the paths as they’re found

<br />

#### 2010

My original solution let the "robot" wander randomly from square 1 every iteration. If the path it wandered ended up being successful, it counted it. An upper limit of only *1500* gives the robot enough chances to find all **184** successful paths. 

Somehow I ended up with *1087* invalid paths.

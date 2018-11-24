# Robot Movements (JavaScript)
[https://www.codeeval.com/public_sc/57/](https://web.archive.org/web/20150721085940/https://www.codeeval.com/public_sc/57/)<br />

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
* debug(true|false): Print the paths as they’re found.

<br />

I'm leveraging previous experience when I shift from a grid metaphor (an array of arrays) into a linear metaphor (a single array) to create a space for my robot.

My first solution let the robot generate random paths up to some limit. I chose a limit of 1500 for a 4x4 grid, which I now realize was a good approximation for the sum of valid + invalid paths ≈ 1087.
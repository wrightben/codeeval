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
* prune(int): Prune when: currentPath length < prune
* debug[ (true|false), (true|false) ]: Print the paths as they’re found, Show Pruning

<br />

I'm leveraging previous experience when I shift from a grid metaphor (an array of arrays) into a linear metaphor (a single array) to create a space for my robot.

My first solution let the robot generate random paths along contiguous squares up to some limit. In other words, in each turn, the computer started at square 1, and then selected contiguous squares that it hadn't selected before *in that turn*. I chose a limit of 1500 for a 4x4 grid, which I now realize was a good approximation for the sum of valid + invalid paths ≈ 1087. My second solution records the results of prior turns.

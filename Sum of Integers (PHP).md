# Sum of Integers <br />
[www.CodeEval.com](https://web.archive.org/web/20120709092623/http://www.codeeval.com:80/public_sc/17) <br />
Posted on October 10, 2011

## Description:

Write a program to determine the largest sum of contiguous integers in a list.

**Input sample:**

The first argument will be a text file containing a comma separated list of integers, one per line. e.g.

> -10, 2, 3, -2, 0, 5, -15<br />2,3,-2,-1,10

**Output sample:**

Print to stdout, the largest sum. In other words, of all the possible contiguous subarrays for a given array, find the one with the largest sum, and print that sum.
e.g.

> 8<br />12

<br />

---
### Code

[sumOfIntegers.php](https://github.com/wrightben/codeeval/blob/master/code/sumOfIntegers.php)

<br />

---
### Run the Code
```sh
time php sumOfIntegers.php input_sample_6.txt
```
# Self-Describing Numbers

### Description

A number is a self-describing number when (assuming digit positions are labeled 0 to N-1), the digit in each position is equal to the number of times that that digit appears in the number.

**Input sample:**

The first argument is the pathname to a file which contains one positive integer per line.

> 2020<br />22<br />1210<br >

**Output sample:**

If the number is a self-describing number, print out a 1. If not, print out a 0 eg.

> 1<br/>0<br/>1

<br />

---
### Run the Code

[selfDescribingNumbers.js](https://github.com/wrightben/codeeval/blob/master/code/selfDescribingNumbers.js)

```sh
time node selfDescribingNumbers.js input_sample_4.txt
```

<br />

---
### About My Solution
**Self-describing number:**<br />
The value of the index is a count of how many times the index is a value.

> **orderedHash**[ 0:2, 1:0, 2:2, 3:0 ]

**Index:**
* 0 has value 2: 1:0, 3:0<br />
* 1 has value 0:
* 2 has value 2: 0:2, 2:2<br />
* 3 has value 0:
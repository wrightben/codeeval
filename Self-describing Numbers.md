# Self Describing Numbers<br />
www.CodeEval.com<br />
Posted on October 9, 2011

## Description:

A number is a self-describing number when (assuming digit positions are labeled 0 to N-1), the digit in each position is equal to the number of times that that digit appears in the number.

**Input sample:**

The first argument is the pathname to a file which contains test data, one test case per line. Each line contains a positive integer. Each line is in the format: N i.e. a positive integer eg.

> 2020<br />22<br />1210<br >

**Output sample:**

If the number is a self-describing number, print out a 1. If not, print out a 0 eg.

> 1<br/>0<br/>1

### My Solution
A self-describing number is an ordered hash, where the hash index is also the numeric symbol. The value of the index is the count of how many times the symbol appears in the number:<br />
> **orderedHash**[ 0:2 1:0 2:2 3:0 ] 

## Code

[selfDescribingNumbers.js](https://github.com/wrightben/codeeval/blob/master/code/selfDescribingNumbers.js)

#### Run the script
```sh
time node selfDescribingNumbers.js input_sample_4.txt
```
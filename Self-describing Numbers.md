# Self Describing Numbers<br />
www.CodeEval.com<br />
Posted on October 9, 2011 by **omitted**	

## Description:

A number is a self-describing number when (assuming digit positions are labeled 0 to N-1), the digit in each position is equal to the number of times that that digit appears in the number.

**Input sample:**

The first argument is the pathname to a file which contains test data, one test case per line. Each line contains a positive integer. Each line is in the format: N i.e. a positive integer eg.

> 2020<br />22<br />1210<br >

**Output sample:**

If the number is a self-describing number, print out a 1. If not, print out a 0 eg.

> 1<br/>0<br/>1

For the curious, here’s how 2020 is a self-describing number: Position ’0′ has value 2 and there is two 0 in the number. Position ’1′ has value 0 because there are not 1′s in the number. Position ’2′ has value 2 and there is two 2. And the position ’3′ has value 0 and there are zero 3′s.

## Code

[selfDescribingNumbers.php](https://github.com/wrightben/codeeval/blob/master/code/selfDescribingNumbers.php)

#### Run the script
```sh
time php selfDescribingNumbers.php input_sample_4.txt
```
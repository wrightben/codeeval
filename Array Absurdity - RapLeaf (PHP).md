# Array Absurdity - RapLeaf (JavaScript)<br />
www.CodeEval.com<br />
Revised Black Friday 2018<br/>
Posted Oct 9, 2011


## Description

Imagine we have an immutable array of size N which we know to be filled with integers ranging from 0 to N-2, inclusive. Suppose we know that the array contains exactly one duplicated entry and that duplicate appears exactly twice. Find the duplicated entry. (For bonus points, ensure your solution has constant space and time proportional to N)

**Input sample:**

Your program should accept as its first argument a path to a filename. Each line in this file is one test case. Ignore all empty lines. Each line begins with a positive integer(N) i.e. the size of the array, then a semicolon followed by a comma separated list of positive numbers ranging from 0 to N-2, inclusive. i.e eg.

> 5;0,1,2,3,0<br />
20;0,1,10,3,2,4,5,7,6,8,11,9,15,12,13,4,16,18,17,14

**Output sample:**

Print out the duplicated entry, each one on a new line eg

> 0<br />4

<br />

---
### Code

[arrayAbsurdity.php](https://github.com/wrightben/codeeval/blob/master/code/arrayAbsurdity.php)


#### About My Solution

[The Art of the Infinite: The Pleasures of Mathematics](https://www.amazon.com/Art-Infinite-Pleasures-Mathematics/dp/1608198693):<br />
> There is a touch of the showman in mathematical presentations,<br />where the deductions are made to look effortless.

The book above shows an easy way to sum a sequence beginning with 0 when no digits are repeated. Here are some examples:

0 + 1 + 2 + 3 = **6** &nbsp;&nbsp;is the same as&nbsp;&nbsp; *( 3 x (3 + 1) ) / 2* = **6**<br />
0 + 1 + 2 + 3 + 4 = **10** &nbsp;&nbsp;is the same as&nbsp;&nbsp; *( 4 x (4 + 1) ) / 2* = **10**<br />
0 + 1 + 2 + 3 + 4 + 5 = **15** &nbsp;&nbsp;is the same as&nbsp;&nbsp; *( 5 x (5 + 1) ) / 2* = **15**

**Algebra Shortcut**

The challenge 5:**0,1,2,3,3** has a length of 5, or **n = 5**. If the **actual sum** of 0 + 1 + 2 + 3 + 3 = **9** and the **expected sum** is equal to: 0 + 1 + 2 + 3 = **6** &nbsp;&nbsp;which is the same as&nbsp;&nbsp; **( (n - 2) x (n - 1) ) / 2** = **6** &nbsp;&nbsp;&nbsp; when n = 5, we know a **3** must be repeated. (See the "3 Repeats" column below.)

<br />

|  | 0  Repeats | 1 Repeats | 2 Repeats | 3 Repeats|
|---:|---:|---:|---:|---:|
|0 | 0 | 0 | 0 | 0|
|1 | 1 | 1 | 1 | 1|
|2 | 2 | 1 | 2 | 2|
|3 | 3 | 2 | 2 | 3|
|4 | 0 | 3 | 3 | 3|
| Actual Sum | **6** | **7** | **8** | **9**|
|Expected Sum | 6 | 6 | 6 | 6|
|Difference | **0** | **1** | **2** | **3**|

<br />

---
### Run the Code
```sh
time php arrayAbsurdity.php input_sample_2.txt
```
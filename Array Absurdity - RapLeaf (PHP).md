# Array Absurdity - RapLeaf (JavaScript)

### Description

Imagine we have an immutable array of size *n* which we know to be filled with digits ranging from 0 to (n - 2). The array contains exactly one duplicate digit. Find it. 

Bonus: Create a solution with constant space and time proportional to n.

**Input sample:**

Your program should accept as its first argument a path to a filename. Each line in this file is one test case. Ignore empty lines.

> 5;0,1,2,3,0<br />
20;0,1,10,3,2,4,5,7,6,8,11,9,15,12,13,4,16,18,17,14

**Output sample:**

Print out the duplicate digit for each line:

> 0<br />4

<br />

---
### Run the Code

[arrayAbsurdity.php](https://github.com/wrightben/codeeval/blob/master/code/arrayAbsurdity.php)

```sh
time php arrayAbsurdity.php input_sample_2.txt
```

<br />

---
### About My Solution

[The Art of the Infinite: The Pleasures of Mathematics](https://www.amazon.com/Art-Infinite-Pleasures-Mathematics/dp/1608198693) shows an easy way to sum a sequence when no digits are repeated. Here are some examples:

0 + 1 + 2 + 3 = **6** &nbsp;&nbsp;is the same as&nbsp;&nbsp; *( 3 x (3 + 1) ) / 2* = **6**<br />
0 + 1 + 2 + 3 + 4 = **10** &nbsp;&nbsp;is the same as&nbsp;&nbsp; *( 4 x (4 + 1) ) / 2* = **10**<br />
0 + 1 + 2 + 3 + 4 + 5 = **15** &nbsp;&nbsp;is the same as&nbsp;&nbsp; *( 5 x (5 + 1) ) / 2* = **15**

<br />

**Challenge Example** (3 Repeats)

The challenge 5:**0,1,2,3,3** has a length of 5, or **n = 5**. If the **actual sum** of 0 + 1 + 2 + 3 + 3 = **9** and the **expected sum** is equal to: 0 + 1 + 2 + 3 = **6**, we know a **3** must be repeated.

Shortcut for *expected sum*:

0 + 1 + 2 + 3 = **6** &nbsp;&nbsp;is the same as&nbsp;&nbsp; ( (n - 2) x (n - 1) ) / 2 = **6** &nbsp;&nbsp;&nbsp; when n = 5

<br />
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
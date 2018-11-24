# Palindromic Ranges (PHP)

[http://www.codeeval.com:80/public_sc/47/](https://web.archive.org/web/20120413153241/http://www.codeeval.com:80/public_sc/47/)

### Description

A positive integer is a palindrome if its decimal representation (without leading zeros) is a palindromic string (a string that reads the same forwards and backwards). For example, the numbers **5**, 77, 363, 4884, 11111, 12121 and 349943 are palindromes.

A range of integers is interesting if it contains an **even number** of palindromes. The range [L, R], with L <= R, is defined as the sequence of integers from L to R (inclusive): (L, L+1, L+2, \..., R-1, R). L and R are the range's first and last numbers.

The range [L1,R1] is a subrange of [L,R] if L <= L1 <= R1 <= R. Your job is to determine how many interesting subranges of [L,R] there are.

**Input Sample:**

Your program should accept as its first argument a path to a filename. Each line in this file is one test case. Each test case will contain two positive integers, L and R (in that order), separated by a space. eg. 

> 1 2<br />
1 7<br />
87 88

**Output Sample:**

For each line of input, print out the number of interesting subranges of [L,R] eg. 

> 1<br/>
12<br/>
1

For the curious: In the third example, the subranges are: [87](0 palindromes), [87,88](1 palindrome), [88](1 palindrome). Hence the number of interesting palindromic ranges is 1

<br />

---
### Run the Code

[palindromicRanges.php](https://github.com/wrightben/codeeval/blob/master/code/palindromicRanges.php)

```sh
time php palindromicRanges.php input_sample_3.txt
```

<br />

---
### About My Solution

> Range: 87 88<br />
Range + Subranges: [87,88](1 palindrome), [87](0 palindromes), [88](1 palindrome)<br />
1 *interesting* subrange: [87](0 palindromes)
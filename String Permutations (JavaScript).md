# String Permutations (JavaScript)

[http://www.codeeval.com:80/public_sc/14/](https://web.archive.org/web/20120123110915/http://www.codeeval.com:80/public_sc/14/)

### Description

Write a program to print out all the permutations of a string in alphabetical order.

**Input sample:**

The first argument will be a text file containing an input string, one per line. e.g.

>hat

**Output sample:**

Print to stdout, permutations of the string, comma separated, in alphabetical order. e.g.

>aht,ath,hat,hta,tah,tha

<br />

---
### Run the Code

[cachedPermutationStrings.js](https://github.com/wrightben/codeeval/blob/master/code/cachedPermutationStrings.js) (Optional)<br />
[stringPermutations.js](https://github.com/wrightben/codeeval/blob/master/code/stringPermutations.js)

```sh
time node stringPermutations.js input_sample_1.txt

# Or ...

# Concatenate files to use cachedPermutationStrings.js
# This command is multiple lines:
cat cachedPermutationStrings.js stringPermutations.js > ~/Desktop/runnable.js \
&& echo -n "numerical" > ~/Desktop/input.txt && cd ~/Desktop && node runnable.js input.txt
```

<br/>

---
### About My Solution
It's possible to generate the complete sorted list of permutations of a numerical sequence by counting up from the min to the max and selecting the interim values having the same digits. This can be done once. 

The sequence 1-2-3 has the permutations: 1-2-3, 1-3-2, 2-1-3, 2-3-1, 3-1-2, 3-2-1. Counting up from 1-2-3 to 3-2-1 will generate the ordered list of permutations.

Each letter of a *word* has a *numerical position* within the word. Since the words *c-a-t*, *d-o-g*, and *p-e-t* are each equal to the sequence *1-2-3* after sorting the letters, the sorted letters of any word can replace the digits in the permutation string of the numerical sequence of the same length.

#### More efficient algorithms

An improvement is to count by 9, leveraging factorial math. An efficient algorithm can use carry rules.

#### Notes
* A final array sort is only necessary when there are duplicate letters. 
* Words with duplicate letters could use modified starting and ending indexes: "abc" = [123,321]; "aac" = [112,211]
* 6 distinct values share the permutation list of 123.
# String Permutations (JavaScript)<br />
[www.CodeEval.com](https://web.archive.org/web/20120123110915/http://www.codeeval.com:80/public_sc/14)<br />
Revised Nov 20, 2018<br />
Posted Oct 10, 2011


## Description

Write a program to print out all the permutations of a string in alphabetical order.

**Input sample:**

The first argument will be a text file containing an input string, one per line. e.g.

>hat

**Output sample:**

Print to stdout, permutations of the string, comma separated, in alphabetical order. e.g.

>aht,ath,hat,hta,tah,tha

<br />

---
### Code

[cachedPermutationStrings.js](https://github.com/wrightben/codeeval/blob/master/code/cachedPermutationStrings.js) (Optional)<br />
[stringPermutations.js](https://github.com/wrightben/codeeval/blob/master/code/StringPermutations.js)

#### About My Solution
A sorted list of the permutations of the numerical sequence *"123"* begins with a min equal to *123* and concludes with a max equal to *321*. It's possible to generate the complete list of permutations by counting up from the min to the max and selecting the interim numbers having the same digits (e.g. *213* and *231*).

The sorted list of permutations for a particular numerical sequence is always the same. Because each *letter* of a word has a *numerical position* within the word, it isn't necessary to calculate the word's permutations. A function can return saved permutations for the equivalent numerical sequence and replace the numbers with the word's letters.

e.g. Both "abc" and "cat" are equivalent to "123".

**Notes**
* The final array sort is only necessary when there are duplicate letters. 
* Words with duplicate letters could use modified starting and ending indexes: "abc" = [123,321]; "aac" = [112,211]

<br/>

---
### Run the Code
```sh
time node stringPermutations.js input_sample_1.txt

# Or ...

# Concatenate files to use cachedPermutationStrings.js
# This command is multiple lines:
cat cachedPermutationStrings.js stringPermutations.js > ~/Desktop/runnable.js \
&& echo -n "123456789" > ~/Desktop/input.txt && cd ~/Desktop && node runnable.js input.txt
```
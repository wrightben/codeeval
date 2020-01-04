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

The letters h-a-t occur in the sequence 2-1-3. The letters can substitute the digits in the ordered list of permutations for the numerical sequence 1-2-3.

##### Example

Once the permutations of a numerical sequence are known, and ordered, they can be substituted with the ordered letters of any word of the same length. Counting from 123 to 321 will produce the ordered permutations 123, 132, 213, 231, 312, 321 after removing values containing other digits and duplicates. 

12, 21 becomes ac, ca <br />
123, 132, 213, 231, 312, 321 becomes ace, aec, cae, cea, eac, eca.

Consider the permutations of 3579. It's easier for me to use the substitution method over the sequence 1234.
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

The letters *a-c-e* occur in the sequence *1-2-3*. This suggests the letters can substitute the digits in the sorted list of permutations of a corresponding numerical sequence—in this case, that sequence is 1-2-3.

Example: 12,21 becomes ac,ca <br />
Example: 123, 132, 213, 231, 312, 321 becomes ace,aec,cae,cea,eac,eca.


#### Algorithms

Generate the sorted list of permutations of a numerical sequence by counting up from the min to the max and selecting the interim values having the same digits. Generating the sorted list of permutations for a numerical sequence has to be done just once.

See ./code/permutations for faster algorithms.

##### Example
The sequence 1-2-3 has the ordered permutations: 123, 132, 213, 231, 312, 321. Counting from 123 to 321 will produce this list after removing the values containing other digits. 
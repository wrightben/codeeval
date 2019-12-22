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
Generate the sorted list of permutations of a numerical sequence by counting up from the min to the max and selecting the interim values having the same digits.

Example: The sequence 1-2-3 has the permutations: 123, 132, 213, 231, 312, 321. Counting from 123 to 321 will produce this list after removing the values with other digits. This can be done once.

Each letter of a *word* has a *numerical position* within the word. Since the words *c-a-t*, *d-o-g*, and *p-e-t* are each equal to the sequence *1-2-3* after sorting the letters, the sorted letters of any word can replace the digits in the permutation string of the numerical sequence of the same length.

#### Other Considerations: nPr

For the sequence 1-2-3-4-5-6-7, we can figure out 7P2 by using the starting index 1-2 and the ending index 7-6.<sup>1</sup>


#### Notes
* Nested for-loops: The file /code/perl/iter.pl generates a conventional nested for-loop structure. It's *way* more efficient than my algorithm, but still generates n^n numbers where n = r.
* A final array sort is only necessary when there are duplicate letters. 
* Words with duplicate letters could use modified starting and ending indexes: "abc" = [123,321]; "aac" = [112,211]
* 6 distinct values share the permutation list of 123.

-----
<sup>1: When n = r, it's possible to increment by 9. When n != r, it might be necessary to increment by 1</sup>
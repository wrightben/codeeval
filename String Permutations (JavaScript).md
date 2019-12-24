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

The letters *a-c-e* occur in the sequence *1-2-3*. This suggests the letters can substitute the digits in the sorted list of permutations of a corresponding numerical sequence—*1-2-3* in this case. This works for any word.

Example: 12,21 becomes ac,ca <br />
Example: 123, 132, 213, 231, 312, 321 becomes ace,aec,cae,cea,eac,eca.


#### Algorithms

Generate the sorted list of permutations of a numerical sequence by counting up from the min to the max and selecting the interim values having the same digits.

Example: The sequence 1-2-3 has the ordered permutations: 123, 132, 213, 231, 312, 321. Counting from 123 to 321 will produce this list after removing the values containing other digits. 

Generating the sorted list of permutations for a numerical sequence has to be done just once. See ./code/permutations for faster algorithms.

#### Notes
* The idea that permutations exist "in order" as values in a sequence is not naive. In fact, it's fundamental.
* A final array sort is only necessary when there are duplicate letters. Words with duplicate letters could use modified starting and ending indexes: "abc" = [123,321]; "aac" = [112,211]
* For the sequence 1-2-3-4-5-6-7, we can figure out 7P2 by using the starting index 1-2 and the ending index 7-6.
* 6 distinct values share the permutation list of 123. The words A-C-T and C-A-T share a permutation string with 1-2-3 as all 3-letter words do. But they have an even closer bond: They produce exactly the same ordered *letter* permutation string.

----
##### JavaScript Test
"event": "Allocation failed - JavaScript heap out of memory"
```
var x = Math.pow(10,10);

for (var i = 1; i < x; i++) {
	console.log( i );
}
```
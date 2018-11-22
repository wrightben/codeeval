# String Permutations (JavaScript)<br />
[www.CodeEval.com](https://web.archive.org/web/20120123110915/http://www.codeeval.com:80/public_sc/14)<br />
Revised Nov 20, 2018<br />
Posted Oct 10, 2011


## Description:

Write a program to print out all the permutations of a string in alphabetical order.

**Input sample:**

The first argument will be a text file containing an input string, one per line. e.g.

>hat

**Output sample:**

Print to stdout, permutations of the string, comma separated, in alphabetical order. e.g.

>aht,ath,hat,hta,tah,tha

---
### Code

[cachedPermutationStrings.js](https://github.com/wrightben/codeeval/blob/master/code/cachedPermutationStrings.js) (Optional)<br />
[stringPermutations.js](https://github.com/wrightben/codeeval/blob/master/code/StringPermutations.js)

#### Run the script
```sh
time node stringPermutations.js input_sample_1.txt
```

#### Run the script (cachedPermutationStrings.js stringPermutations.js) on ~Desktop
```sh
# cd codeeval/code
cat cachedPermutationStrings.js stringPermutations.js > ~/Desktop/runnable.js && echo -n "123456789" > ~/Desktop/input.txt && cd ~/Desktop && node runnable.js input.txt
```

---
### About My Solution<br/>

A sorted list of the permutations of the numerical sequence *"123"* begins with a min equal to *123* and concludes with a max equal to *321*. It's possible to generate the complete list of permutations by counting up from the min to the max and selecting the interim numbers having the same digits (e.g. *213* and *231*).

The sorted list of permutations for a particular numerical sequence is always the same. And because each respective *letter* of a string, as in "abc", has an array index equivalent to the numerical sequence ("abc" is equivalent to "123"), it isn't necessary to calculate the permutations for any *non-numeric* string. A function can return a previously-generated sorted list of permutations for a numerical sequence and swap the numbers with the respective letters.

**Notes**
* The final array sort is only necessary when there are duplicate letters. 
* Words with duplicate letters could benefit by using modified starting and ending indexes:<br/>"abc" = [123,321]; "aac" = [112,211]



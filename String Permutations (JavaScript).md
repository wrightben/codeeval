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

### My Solution:<br/>
*Aiming for performance and clarity.*

A sorted list of the permutations of the numerical sequence *123* begins with a min equal to *123* and concludes with a max equal to *321*. It's possible to generate the complete list of permutations by counting up from the min to the max and selecting the interim numbers having the same digits (e.g. *213* and *231*).

The sorted list of permutations for a particular numerical sequence is always the same. And because each respective *letter* of a string, as in "abc", has an array index equivalent to the numerical sequence ("abc" is equivalent to "123"), it isn't necessary to calculate the permutations for *any* word. A function can return a previously-generated sorted list of permutations for a numerical sequence and swap the numbers with the respective letters.

**Notes on Performance**
* It's possible to create a modified starting index: "abc" = "123" but "aac" == "112". "112" reduces the ending index for this 3-letter word from 321 to 211.
* The final array sort is only necessary when there are duplicate letters. 

## Code

[cachedPermutationStrings.js](https://github.com/wrightben/codeeval/blob/master/code/cachedPermutationStrings.js) (Optional)<br />
[stringPermutations.js](https://github.com/wrightben/codeeval/blob/master/code/StringPermutations.js)

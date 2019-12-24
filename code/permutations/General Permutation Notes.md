## General Permutation Notes

* The numerical permutation string is a substitute for any orderable concept.
* The idea that permutations exist "in order" as values in a sequence is not naive. In fact, it's fundamental.
* A final array sort is only necessary when there are duplicate letters. Words with duplicate letters could use modified starting and ending indexes: "abc" = [123,321]; "aac" = [112,211]
* For the sequence 1-2-3-4-5-6-7, we can figure out 7P2 by using the starting index 1-2 and the ending index 7-6.
* 6 distinct values share the permutation list of 123. The words A-C-T and C-A-T share a permutation string with 1-2-3 as all 3-letter words do. But they have an even closer bond: They produce exactly the same ordered *letter* permutation string.

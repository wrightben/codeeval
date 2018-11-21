# Array Absurdity <br />
[www.CodeEval.com](https://web.archive.org/web/20120510131553/http://www.codeeval.com/public_sc/41/) (RapLeaf)<br />
Posted on October 9, 2011

## Description:

Imagine we have an immutable array of size N which we know to be filled with integers ranging from 0 to N-2, inclusive. Suppose we know that the array contains exactly one duplicated entry and that duplicate appears exactly twice. Find the duplicated entry. (For bonus points, ensure your solution has constant space and time proportional to N)

**Input sample:**

Your program should accept as its first argument a path to a filename. Each line in this file is one test case. Ignore all empty lines. Each line begins with a positive integer(N) i.e. the size of the array, then a semicolon followed by a comma separated list of positive numbers ranging from 0 to N-2, inclusive. i.e eg.

> 5;0,1,2,3,0<br />20;0,1,10,3,2,4,5,7,6,8,11,9,15,12,13,4,16,18,17,14

**Output sample:**

Print out the duplicated entry, each one on a new line eg

> 0<br />4

## Code

```php
#!/usr/bin/php
<?php

$file;
(isset($argv[1])) ? $file = $argv[1]:exit("Must provide a file");


/*  FileHandler:
    Wrap some common read operations.
*/
class FileHandler { 

    /*  readByLine
        Use: FileHandler::readByLine('filePath',true);
    */
    public static function readByLine($file /*Full file path*/,$rtrim /*Boolean*/) { // Return an array of lines
        $lines = array();
        (ISSET($rtrim) && ($rtrim == true)) ? $rtrim = true: $rtrim = false;
        $file_handle = fopen($file, "r");
        while (!feof($file_handle)) {
            $line = fgets($file_handle);
            if ($rtrim) { $line = rtrim($line); }
            array_push($lines,$line);
        }
        fclose($file_handle);
        return $lines;
    }
}

$contents = FileHandler::readByLine($file,true);
foreach ($contents as $line) {
    if (strlen($line) < 3) {continue;}
    $segments = preg_split("/;/",$line);
    $length = $segments[0];
    $list = preg_split("/,/",$segments[1]);
    $expected = 0;
    $actual = 0;
    for ($i = 0; $i < $length; $i++) {
        $expected = $expected + $i;
        $actual += $list[$i];
    }
    print $length - (abs($actual - $expected)+1)."\n";
}

exit;
?>
```

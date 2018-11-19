# Self Describing Numbers<br />
www.CodeEval.com<br />
Posted on October 9, 2011 by **omitted**	

## Description:

A number is a self-describing number when (assuming digit positions are labeled 0 to N-1), the digit in each position is equal to the number of times that that digit appears in the number.

**Input sample:**

The first argument is the pathname to a file which contains test data, one test case per line. Each line contains a positive integer. Each line is in the format: N i.e. a positive integer eg.

2020
22
1210

**Output sample:**

If the number is a self-describing number, print out a 1. If not, print out a 0 eg.

> 1<br/>0<br/>1

For the curious, here’s how 2020 is a self-describing number: Position ’0′ has value 2 and there is two 0 in the number. Position ’1′ has value 0 because there are not 1′s in the number. Position ’2′ has value 2 and there is two 2. And the position ’3′ has value 0 and there are zero 3′s.

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
    $ints = str_split($line);
    $l = count($ints);
    $state = 1;
    for ($i = 0; $i < $l; $i++) {
        $c = 0;
        preg_match_all("/$i/",$line,$m,PREG_OFFSET_CAPTURE);
        if (isset($m[0])) { $c = count($m[0]); }
        if ($c != $ints[$i]) {
            $state = 0;
            break;
        }
    }
    print $state."\n";
}


exit;
?>
```
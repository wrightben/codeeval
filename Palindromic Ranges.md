# Palindromic Ranges (PHP) <br />
[www.CodeEval.com](https://web.archive.org/web/20120413153241/http://www.codeeval.com:80/public_sc/47/) <br />
Posted on October 10, 2011

## Challenge Description

A positive integer is a palindrome if its decimal representation (without leading zeros) is a palindromic string (a string that reads the same forwards and backwards). For example, the numbers 5, 77, 363, 4884, 11111, 12121 and 349943 are palindromes.

A range of integers is interesting if it contains an even number of palindromes. The range [L, R], with L <= R, is defined as the sequence of integers from L to R (inclusive): (L, L+1, L+2, \..., R-1, R). L and R are the range's first and last numbers.

The range [L1,R1] is a subrange of [L,R] if L <= L1 <= R1 <= R. Your job is to determine how many interesting subranges of [L,R] there are.

**Input**<br/>Your program should accept as its first argument a path to a filename. Each line in this file is one test case. Each test case will contain two positive integers, L and R (in that order), separated by a space. eg. 

> 1 2<br />
1 7<br />
87 88

**Output**<br/>For each line of input, print out the number of interesting subranges of [L,R] eg. 

> 1<br/>
12<br/>
1

For the curious: In the third example, the subranges are: [87](0 palindromes), [87,88](1 palindrome),[88](1 palindrome). Hence the number of interesting palindromic ranges is 1


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

/*  SequenceHelper
    Task-based helper methods
*/
class SequenceHelper {
    
    private $rcount = 0;
    private $cache = array();
    
    public function getPalindromicSubRanges($range) {
        $this->cache[join("",$range)] = true;
        
        //print "RANGE: ".join(",",$range)."\n";
        
        $pc = $this->getPalindromeCount($range);
        if (($pc % 2) == 0) {
            //print " (Q)";
            $this->rcount += 1;
        }
        //print "\n";
        

        $l = count($range);     
        if ($l > 1) {
            $sr1 = array_slice($range,0,-1); //First Chunk
            $sr2 = array_slice($range,1); //Second Chunk   
            if(!(isset($this->cache[join("",$sr1)]))) {
                $this->getPalindromicSubRanges($sr1);
            }
            if(!(isset($this->cache[join("",$sr2)]))) {
                $this->getPalindromicSubRanges($sr2);
            }
        }


        return $this->rcount;
    }
    
    public function getPalindromeCount($range) {
        $pcount = 0;
        foreach($range as $item) {
            if ($this->isElementPalindrome($item)) {
                $pcount += 1;
            }
        }
        return $pcount;
    }
    
    public function isElementPalindrome($item) {
        $letters = str_split($item);
        $meti = join("",array_reverse($letters));
        if ("".$meti == "".$item) {
            return true;
        }
        return false;
    }
    
    
}


$contents = FileHandler::readByLine($file,true);
$subs = array();
foreach ($contents as $line) {
    if (strlen($line) == 0) { continue; }
    $range = preg_split("/\s/",$line);
    $range = range($range[0],$range[1]);
    $s = new SequenceHelper;
    $c = $s->getPalindromicSubRanges($range);
    if ($c == 0){
        print " \n";
    } else {
        print $c."\n";
    }
}

exit;
?>
```

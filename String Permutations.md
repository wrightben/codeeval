
# String Permutations <br />
www.CodeEval.com <br />
Posted on October 10, 2011 by **omitted**

## Description: 

Write a program to print out all the permutations of a string in alphabetical order.

**Input sample:** The first argument will be a text file containing an input string, one per line. e.g.

> hat

**Output sample:** Print to stdout, permutations of the string, comma separated, in alphabetical order. e.g.

> aht,ath,hat,hta,tah,tha

### My Solution:

The function below solves the test as it’s presented on CodeEval. I believe the input file consists of a single line, and the word is *hat*, exactly as it appears in the example. *This function will fail for words longer than three letters.* 

However, the basic algorithm is the same for longer words. In the case of the word *help*, the function below will produce 8 of the permutations: *help, elph, lphe, phel*, and the inverse of each: *pleh, hple, ehpl, lehp*. 

We know that there are 24 permutations when we use all four letters according to N!, or (4\*3\*2\*1). So where are the other 16 permutations? We need to shift a letter and perform the same inverse function. If we take *help*, and make it *ehlp*, and then run the inverse funcation again, we’ll produce another 8 of the permutations. So, to get the last 8, we’ll need to shift again and make *ehlp* into *elhp*.

But how do we know how many times we have to shift? The answer is ((n)!/(2n))-1. So, for a 3-letter word, we don’t need to shift at all. For a 4-letter word, we shift (24/8) – 1 = 2 times. And for a 5-letter word, we’ll be shifting 120/10 – 1 = 11 times.

The best algorithms originate from pencil and paper: You don’t need to model the whole world in math, if you can see what’s right in front of you.

## Code

```php
#!/usr/bin/php
<?php

$file;
(isset($argv[1])) ? $file = $argv[1]:exit("Must provide a file");

// File Reading
class FileHandler { 

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

// Permutations
class SequenceHandler {
    
    private $word;
    private $letters;
    private $permutations = array();
    private $permutationsAsStrings = array();
    
    function __tostring() {return "SequenceHandler";}
    
    function __construct($word) {
        $this->word = $word;
        $this->letters = str_split($word);
    }
    
    public function getPermutations() {
        
        $letters = $this->letters;
        foreach ($letters as $letter) { //Cheat Loop Length!
            array_push($this->permutations,$this->letters);    
            array_push($this->permutationsAsStrings,join("",$this->letters));
            array_push($this->letters,array_shift($this->letters));
        }
        
        $temp = array_slice($this->permutations,0);
        foreach ($temp as $new) {
            array_push($this->permutationsAsStrings,join("",array_reverse($new)));
        }
        
        sort($this->permutationsAsStrings);
        return $this->permutationsAsStrings;
    }

    
    
}

$contents = FileHandler::readByLine($file,true);
$subs = array();
foreach ($contents as $line) {
    if (strlen($line) == 0) { continue; }
    $s = new SequenceHandler($line);
    $p = $s->getPermutations();
    print join(",",$p)."\n";
}

exit;
?>
```

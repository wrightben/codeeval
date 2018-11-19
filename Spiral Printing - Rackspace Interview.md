# Spiral Printing<br />
RackSpace Interview<br />
Posted on October 8, 2011 by **omitted**

## Description:

Write a function to print a 2-D array (n x m) in spiral order (clockwise).


**Input samples:**

> 1 2 3<br />4 5 6<br />7 8 9 

or

>abcde<br/>nopqf<br/>mtsrg<br/>lkjih

**Output sample:**

> 1 2 3 6 9 8 7 4 5

### My Solution

I received this test when applying for a JavaScript engineer position with Rackspace. That struck me as unorthodox, so I decided to amuse myself. (I was bored with the multiple-iterator approach commonly used to solve this puzzle.) "Never ascribe to malice that which is adequately explained by incompetence", said someone supposedly. I hope that explains both the test and my solution.

## Code

```php
#!/usr/bin/php
<?php


$file;
(isset($argv[1])) ? $file = $argv[1]:exit("Must provide a file");
 
/*  ArrayWalker (interface)
 
*/
interface ArrayWalker {
    function walk();
    function getElement($y,$x);
}
 
/* FileParser (interface)
 
*/
interface FileParser {
    function toObjectFromFile($fileContentsAsArray);
}
 
/*  SpiralArray:
    Expects 2D array; Walks array in specified pattern,
    and returns elements given a position.
*/
class SpiralArray implements ArrayWalker,FileParser {  
 
    private $twoDimArray;
    private $twoDimArrayOrdered = array();
 
    function __construct() {
 
    }
 
    function __toString() {
        return "SpiralArray";
    }
 
    public function walk() {
        $height = count($this->twoDimArray);
        $width = count($this->twoDimArray[0]);
        $box = $height * $width;
 
        $this->right($height, $width, $box);
 
        return $this;
    }
 
    public function getElement($y /*int*/,$x /*int*/) {
        return $this->twoDimArray[$y][$x];
    }
 
    public function getElementAtPoint($i /*int*/) {
        return $this->twoDimArrayOrdered[$i];
    }
 
    public function toObjectFromFile($fileContentsAsArray) {
        $y = 0;
        $x = 0;
        foreach ($fileContentsAsArray as $line) {
            $line = preg_split("/\s/",$line);
            foreach ($line as $digit) {
                $this->twoDimArray[$y][$x] = $digit;
                $x ++;
            }
            $x = 0;
            $y ++;
        }
        return $this;
    }
 
    public function get() {
        return $this->twoDimArrayOrdered;
    }
 
    private function right ($height,$width,$box) {
        $l = 0;
        $r = $width - 1;
        $t = 0;
        $b = $height - 1;
        $dir = 0; //1,2,3
 
        $i1 = $t;
        $i2 = $l;
 
        for ($i = 0; $i < $box; $i ++ ){
 
            array_push($this->twoDimArrayOrdered, $this->getElement($i1,$i2));
 
             switch($dir) {
             case 0:
                $i2 += 1;
                if ($i2 > $r) { //Going right
                    $i2 -= 1; //Shift back left
                    $t += 1; //Set the top boundary down
                    $i1 = $t;
                    $dir = 1; //Change direction
                }
                break;
            case 1:
                $i1 += 1;
                if ($i1 > $b) { //Going down
                    $i1 -= 1; //Shift back up
                    $r -= 1; //Shift the right boundary left
                    $i2 = $r;
                    $dir = 2;
                }
                break;
            case 2:
                $i2 -= 1;
                if ($i2 < $l) { //Going left
                    $i2 += 1; //Shift back right
                    $b -= 1; //Shift the bottom boundary up
                    $i1 = $b;
                    $dir = 3;
                }
                break;
            case 3:
                $i1 -= 1;
                if ($i1 < $t) { //Going up
                    $i1 += 1; //Shift back down
                    $l += 1; //Shift the left boundary right
                    $i2 = $l;
                    $dir = 0;
                }
                break;
            }
        }
    }
 
    private function left() {
        /* Future Implementation */
    }
 
}
 
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
 
$a = new SpiralArray();
print join(" ",$a->toObjectFromFile(FileHandler::readByLine($file,true))->walk()->get());
 
exit;
?>
```
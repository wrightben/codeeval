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
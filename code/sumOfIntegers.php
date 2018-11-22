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
    
    private $hwm = 0;
    // Prep to the actual array for the highest total
    private $SequenceHelperStore = array();
    private $currentIndex = 0;
    
    public function getSubRanges($range) {
        $sum = array_sum($range);
        ($sum > $this->hwm) ? $this->hwm = $sum : false;
        
        //Prep to return the array
        array_push($this->SequenceHelperStore,array($sum,$range));
    
        $l = count($range);
        if ($l > 2) {
            $sr1 = array_slice($range,0,-1); //First Chunk
            $sr2 = array_slice($range,1); //Second Chunk            
            $this->getSubRanges($sr1);
            $this->getSubRanges($sr2);
        }

        return $this->hwm;
    }
    
}


$contents = FileHandler::readByLine($file,true);
$subs = array();
foreach ($contents as $line) {
    if (strlen($line) == 0) { continue; }
    $numbers = preg_split("/(, )|(,)/",$line);
    $s = new SequenceHelper();
    print $s->getSubRanges($numbers)."\n";
}

exit;
?>
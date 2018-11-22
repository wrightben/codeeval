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
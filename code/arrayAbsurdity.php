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
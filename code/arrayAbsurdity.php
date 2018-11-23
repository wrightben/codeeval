#!/usr/bin/php
<?php

$file;
( isset( $argv[1] ) ) ? $file = $argv[1] : exit( "Must provide a file" );

$contents = readfile($file);

print $contents;

/*
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
*/


exit;
?>
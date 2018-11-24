#!/usr/bin/php
<?php

// Lines
( isset( $argv[1] ) ) ? 
	$lines =  explode( "\n", file_get_contents( $argv[1] ) ) : 
	exit( "Must provide a file" );

foreach ($lines as $line) {
	
	if (strlen($line) < 3) { continue; }
    
	$segments = preg_split( "/;/", $line ); // Or explode( ";", $line )
	$length = $segments[0];
	$list = preg_split( "/,/", $segments[1] );

	$sum = array_sum( $list ); // Or foreach

	/* $expected = ( (n^2 -3n +2) / 2 ) */	
	$expected = ( ( $length - 2 ) * ( $length - 1 ) ) / 2;
	
	print ( $sum - $expected ) . "\n";

}

exit;
?>
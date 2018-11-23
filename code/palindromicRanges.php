#!/usr/bin/php
<?php


class SequenceHelper {
    
    private $rcount = 0;
    private $cache = array();
    
    public function getPalindromicSubRanges($range) {

        $this->cache[ join("",$range) ] = true;
        
        $pc = $this->getPalindromeCount($range);

        if ( ($pc % 2) == 0 ) { $this->rcount += 1; }

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
    
		public function getPalindromeCount( $range ) {

		$pcount = 0;

		foreach($range as $item) {
			if ( $this->isElementPalindrome( $item ) ) {
				$pcount += 1;
			}
		}

			return $pcount;

		}
    
    public function isElementPalindrome( $item ) {
       
		$letters = str_split( $item );
		$meti = join( "", array_reverse( $letters ) );
		if ( "".$meti == "".$item ) {
			return true;
        }
		return false;
		
    }
    
}

// Lines
( isset( $argv[1] ) ) ? 
	$lines =  explode("\n", file_get_contents( $argv[1] ) ) : 
	exit( "Must provide a file" );



foreach ($lines as $line) {

	if (strlen($line) == 0) { continue; }

	$range = preg_split("/\s/",$line);

	$range = range($range[0],$range[1]);

	$s = new SequenceHelper;

	$c = $s->getPalindromicSubRanges($range);

	($c == 0) ? print " \n" : print $c."\n";

}

exit;
?>
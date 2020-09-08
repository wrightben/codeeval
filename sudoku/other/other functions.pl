sub outputPuzzleTSV () {
	foreach $i (0 .. 80) {
		print $cells[$i];
		if  ( (($i + 1) > 0) && (($i + 1) % 9 == 0) ) {
			print "\n";
		} else {
			print "\t";
		}
	}
}

sub testIndex() {

#	OVERVIEW: Prints summary information for a position within the 0-based CSV
# 	[num, index, row, col, rows, cols, box]
# 	[28, 28*, 4, 1, [28,29,30,31,32,33,34,35,36], [1,10,19,28,37,46,55,64,73], [28,29,30,37,38,39,46,47,48]

	my $index = shift;

	print "[num, index, row, col, rows, cols, box]\n"; # Header
	print "[$num, ".($index +1)."*, ". $rc[$index][0] .", ".$rc[$index][1]; # Row and Col
	print ", [", ( join ",",  @{ $rows[ $rc[$index][0] - 1] } ),  "]" ; # Row Indicies
	print ", [", ( join ",",  @{ $cols[ $rc[$index][1] - 1] } ),  "]" ; # Col Indicies
	print ", [", ( join ",",  @{ $indexesInBox[ $indexToBox[$index] -1 ] } ),  "]" ; # Box (9-digit permutation)
	print "\n\n";

	return "";
	
}
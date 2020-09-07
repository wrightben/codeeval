#!/usr/bin/perl

# SECTION:
#	Overview: Constants for rows, cols, and 9-digit boxes.
# 	1. EXCEL: Use it to make these constants.
#	2. READ: Either inline or from external csv; See puzzle ( sudoku.csv ).

@rc = (
	[ 1, 1 ], [ 1, 2 ], [ 1, 3 ], [ 1, 4 ], [ 1, 5 ], [ 1, 6 ], [ 1, 7 ], [ 1, 8 ], [ 1, 9 ],
	[ 2, 1 ], [ 2, 2 ], [ 2, 3 ], [ 2, 4 ], [ 2, 5 ], [ 2, 6 ], [ 2, 7 ], [ 2, 8 ], [ 2, 9 ],
	[ 3, 1 ], [ 3, 2 ], [ 3, 3 ], [ 3, 4 ], [ 3, 5 ], [ 3, 6 ], [ 3, 7 ], [ 3, 8 ], [ 3, 9 ],
	[ 4, 1 ], [ 4, 2 ], [ 4, 3 ], [ 4, 4 ], [ 4, 5 ], [ 4, 6 ], [ 4, 7 ], [ 4, 8 ], [ 4, 9 ],
	[ 5, 1 ], [ 5, 2 ], [ 5, 3 ], [ 5, 4 ], [ 5, 5 ], [ 5, 6 ], [ 5, 7 ], [ 5, 8 ], [ 5, 9 ],
	[ 6, 1 ], [ 6, 2 ], [ 6, 3 ], [ 6, 4 ], [ 6, 5 ], [ 6, 6 ], [ 6, 7 ], [ 6, 8 ], [ 6, 9 ],
	[ 7, 1 ], [ 7, 2 ], [ 7, 3 ], [ 7, 4 ], [ 7, 5 ], [ 7, 6 ], [ 7, 7 ], [ 7, 8 ], [ 7, 9 ],
	[ 8, 1 ], [ 8, 2 ], [ 8, 3 ], [ 8, 4 ], [ 8, 5 ], [ 8, 6 ], [ 8, 7 ], [ 8, 8 ], [ 8, 9 ],
	[ 9, 1 ], [ 9, 2 ], [ 9, 3 ], [ 9, 4 ], [ 9, 5 ], [ 9, 6 ], [ 9, 7 ], [ 9, 8 ], [ 9, 9 ]
);

@rows = (
	[ 1, 2, 3,  4, 5, 6,  7, 8, 9],
	[10,11,12, 13,14,15, 16,17,18],
	[19,20,21, 22,23,24, 25,26,27],
	
	[28,29,30, 31,32,33, 34,35,36],
	[37,38,39, 40,41,42, 43,44,45],
	[46,47,48, 49,50,51, 52,53,54],
	
	[55,56,57, 58,59,60, 61,62,63],
	[64,65,66, 67,68,69, 70,71,72],
	[73,74,75, 76,77,78, 79,80,81]
); # @{ $rows[ $rc[$index][0] - 1] } )

@cols = (
	[1,10,19,28,37,46,55,64,73],
	[2,11,20,29,38,47,56,65,74],
	[3,12,21,30,39,48,57,66,75],
	[4,13,22,31,40,49,58,67,76],
	[5,14,23,32,41,50,59,68,77],
	[6,15,24,33,42,51,60,69,78],
	[7,16,25,34,43,52,61,70,79],
	[8,17,26,35,44,53,62,71,80],
	[9,18,27,36,45,54,63,72,81]
); # @{ $cols[ $rc[$index][1] - 1] } )

@indexToBox = (	
	1,1,1, 2,2,2, 3,3,3,
	1,1,1, 2,2,2, 3,3,3,
	1,1,1, 2,2,2, 3,3,3,

	4,4,4, 5,5,5, 6,6,6,
	4,4,4, 5,5,5, 6,6,6,
	4,4,4, 5,5,5, 6,6,6,

	7,7,7, 8,8,8, 9,9,9,
	7,7,7, 8,8,8, 9,9,9,
	7,7,7, 8,8,8, 9,9,9
);

@indexesInBox = (
	[1,2,3,10,11,12,19,20,21],
	[4,5,6,13,14,15,22,23,24],
	[7,8,9,16,17,18,25,26,27],
	[28,29,30,37,38,39,46,47,48],
	[31,32,33,40,41,42,49,50,51],
	[34,35,36,43,44,45,52,53,54],
	[55,56,57,64,65,66,73,74,75],
	[58,59,60,67,68,69,76,77,78],
	[61,62,63,70,71,72,79,80,81]
); # @{ $indexesInBox[ $indexToBox[$index] -1 ] }


@boxes = ( # zero-based
	[], #1
	[], #2
	[], #3
	[], #4
	[], #5
	[], #6
	[], #7
	[], #8
	[]  #9
);

# END












# SECTION: 
# 	1. Read sudoku.csv
# 	2. create array of 81 known/unknown values
# 	3. each line: replace unknown (blank) values with list of possible values based on puzzle's initial known values
	
@lines = (<STDIN>);
chomp @lines;

$line = join ",", @lines;
@nums = split /,/g, $line;


# Get the possible values for the unknown cells.
foreach $i ( 0 .. 80 ) {
	$cell = $nums[$i];

	if ( $cell =~ /_/ ) {
		$nums[$i] = &getPossible($i);
	}
}

# 
foreach $i ( 0 .. 8 ) {
	$regex = "";
	foreach $item ( @{ $indexesInBox[ $i ] } ) {
		$regex .= '['. ( join '|', (split //, $nums[$item -1] ) ) . ']';
	}
	@{$boxes[$i]} = split /\n/, `cat permutations.txt | grep -E "$regex"`;

	print "$regex\n";
	print join ";\t", @{ $boxes[ $i ] };
	print "\n\n";
}





# END














# SECTION: FUNCTIONS	

sub getPossible($index) {

	my $index = shift;

	@row = @{ $rows[ $rc[$index][0] - 1 ] };
	@col = @{ $cols[ $rc[$index][1] - 1 ] };
	@box = @{ $indexesInBox[ $indexToBox[$index] -1 ] };

	@possible = (1,2,3,4,5,6,7,8,9);

	# Row
	foreach $i (@row) { # NOT zero-based
		my $num = $nums[$i - 1];
		if ($num =~ /\d/) { $possible[$num -1] = undef; }
	}
	
	# Col
	foreach $i (@col) { # NOT zero-based
		my $num = $nums[$i - 1];
		if ($num =~ /\d/) { $possible[$num -1] = undef; }
	}
		
	# Box
	foreach $i (@box) { # NOT zero-based
		my $num = $nums[$i - 1];
		if ($num =~ /\d/) { $possible[$num -1] = undef; }
	}

	
	return join "", @possible;


}

sub outputPuzzleTSV () {
	foreach $i (0 .. 80) {
		print $nums[$i];
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

# END

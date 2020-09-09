#!/usr/bin/perl

use Data::Dumper;
# print Dumper \@myarray


# SECTION:
#	Overview: Constants for rows,cols,and 9-digit boxes.
# 	1. EXCEL: Use it to make these constants.
#	2. READ: Either inline or from external csv; See puzzle ( sudoku.csv ).

@rc = (
	[ 1,1 ],[ 1,2 ],[ 1,3 ],[ 1,4 ],[ 1,5 ],[ 1,6 ],[ 1,7 ],[ 1,8 ],[ 1,9 ],
	[ 2,1 ],[ 2,2 ],[ 2,3 ],[ 2,4 ],[ 2,5 ],[ 2,6 ],[ 2,7 ],[ 2,8 ],[ 2,9 ],
	[ 3,1 ],[ 3,2 ],[ 3,3 ],[ 3,4 ],[ 3,5 ],[ 3,6 ],[ 3,7 ],[ 3,8 ],[ 3,9 ],
	[ 4,1 ],[ 4,2 ],[ 4,3 ],[ 4,4 ],[ 4,5 ],[ 4,6 ],[ 4,7 ],[ 4,8 ],[ 4,9 ],
	[ 5,1 ],[ 5,2 ],[ 5,3 ],[ 5,4 ],[ 5,5 ],[ 5,6 ],[ 5,7 ],[ 5,8 ],[ 5,9 ],
	[ 6,1 ],[ 6,2 ],[ 6,3 ],[ 6,4 ],[ 6,5 ],[ 6,6 ],[ 6,7 ],[ 6,8 ],[ 6,9 ],
	[ 7,1 ],[ 7,2 ],[ 7,3 ],[ 7,4 ],[ 7,5 ],[ 7,6 ],[ 7,7 ],[ 7,8 ],[ 7,9 ],
	[ 8,1 ],[ 8,2 ],[ 8,3 ],[ 8,4 ],[ 8,5 ],[ 8,6 ],[ 8,7 ],[ 8,8 ],[ 8,9 ],
	[ 9,1 ],[ 9,2 ],[ 9,3 ],[ 9,4 ],[ 9,5 ],[ 9,6 ],[ 9,7 ],[ 9,8 ],[ 9,9 ]
);

@rows = (
	[ 1,2,3, 4,5,6, 7,8,9],
	[10,11,12,13,14,15,16,17,18],
	[19,20,21,22,23,24,25,26,27],
	
	[28,29,30,31,32,33,34,35,36],
	[37,38,39,40,41,42,43,44,45],
	[46,47,48,49,50,51,52,53,54],
	
	[55,56,57,58,59,60,61,62,63],
	[64,65,66,67,68,69,70,71,72],
	[73,74,75,76,77,78,79,80,81]
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
	1,1,1,2,2,2,3,3,3,
	1,1,1,2,2,2,3,3,3,
	1,1,1,2,2,2,3,3,3,

	4,4,4,5,5,5,6,6,6,
	4,4,4,5,5,5,6,6,6,
	4,4,4,5,5,5,6,6,6,

	7,7,7,8,8,8,9,9,9,
	7,7,7,8,8,8,9,9,9,
	7,7,7,8,8,8,9,9,9
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


@rowSummaries = ();
@colSummaries = ();

@boxes = ( # zero-based
	[],#1
	[],#2
	[],#3
	[],#4
	[],#5
	[],#6
	[],#7
	[],#8
	[]  #9
);

@regexes = ();

# END












# SECTION: 
# 	1. Read sudoku.csv
# 	2. create array of 81 known/unknown values
# 	3. each line: replace unknown (blank) values with list of possible values based on puzzle's initial known values

# Config
	$debug 			= 1; # 1 = true/on, etc.
	$maxPuzzleAttempts 	= 50;
	$solvePuzzleCount	= 0; # Count the number of iterations for solvePuzzle
	$knownValues		= 0;
	$fail			= 0;
	$file			= '1 - permutations.txt';

# Read Puzzle	
@lines = (<STDIN>);
chomp @lines;
$puzzle = join "\t",@lines; # !Performed every iteration.
@cells = split /\t/g,$puzzle; # !Performed every iteration.

# Solve Puzzle
while (  
	( $fail != 1 ) && 
	( $sovlePuzzleCount < $maxPuzzleAttempts ) && 
	( $puzzle =~ /\./ ) ) { 
	
	&solvePuzzle();
	
}

# END














# SECTION: FUNCTIONS
sub solvePuzzle {

	$solvePuzzleCount += 1;
		
	if ($debug) { 
		if ($solvePuzzleCount > 1) { print ("\n" x 10); }
		print "=== solvePuzzle ($solvePuzzleCount) ===\n";
	}
	
	$knownValues = &getKnownCount;
	print "Input TSV (".$knownValues.")\n";
	&outputPuzzleTSV();


	# Summarize rows, cols, and boxes
	@rowSummaries = @{ &getRowSummaries };
	@colSummaries = @{ &getColSummaries };
	@boxSummaries = @{ &getBoxSummaries };


	# Get the possible values for the unknown cells.
	foreach $i ( 0 .. 80 ) {

		if ( $cells[$i] =~ /\./ ) {
			$cells[$i] = &getPossible($i);
		}
	
	}

	# Build a regex for each box and get all compatible permutations
	foreach $i ( 0 .. 8 ) {

		$regex = "";
		foreach $item ( @{ $indexesInBox[ $i ] } ) {
			#$regex .= $regex .= '['.$cells[$item -1].']'; # SLOW: w/o pipe
			$regex .= '['. ( join '|',(split //,$cells[$item -1] ) ) . ']'; # FAST: w/ pipe
		}
		push @regexes,$regex;	

		@{$boxes[$i]} = split /\n/,`cat "${file}" | grep -e "$regex"`;
	
	}



	# DEBUG:
	# OUTPUT REGEX BOXES
	if ($debug) {
		print "\n\n";
		&outputRegexBox();
	}

	foreach $i ( 0 .. 8 ) { # Boxes ( 0 .. 8 )

		my $totalPermutations = @{$boxes[$i]}; # The # of permutations (123456789) matching the regex for this box
		my @charPercent = @{ &getCellSummary( $i ) }; # Summary of all characters for the entire box
	
		for my $ii ( 0 .. 8 ) { # Cell ( 0 .. 8 ) in Boxes ( 0 .. 8 )

			# Cell	
			my $cellIndex = $indexesInBox[ $i ][$ii] - 1; # The cell $ii in the box $i.
			my @cellSummmary = @{ $charPercent[ $ii ] }; # cellSummary: how many times (1..9) in cell from all permutations (box)
		
	# 		print "Cell Index: $cellIndex \t Current Value: $cells[$cellIndex] \t Total Permutations: $totalPermutations\n";
		
	# 		print Dumper \@cellSummmary;
	# 		print "\n";
		
			for my $iii ( 0 .. 8 ) {
	# 			print "Cell Summary: $cellSummmary[$iii] \t iii: $iii \t Cell Index: $cellIndex \t Cell Value: $cells[$cellIndex]\n";
				if ( $cellSummmary[$iii] == $totalPermutations ) {
					$cells[$cellIndex] = $iii + 1; # Set the cell to the digit when the digit occurs in every permutation.
				}
			}
		
		}
	
	}
	
	# Print out the TSV with knowns + regex values
	print "Processing TSV\n";
	&outputPuzzleTSV();
	print "\n\n";
	
	
	# Reset puzzle TSV
	$puzzle = join "\t", @cells;
	$puzzle =~ s/(\d\d+)/\./g;
	@cells = split /\t/g,$puzzle;
	
	
	# Print out the TSV with knowns
	print "Output TSV (".&getKnownCount.")\n";
	&outputPuzzleTSV();
	
	
	# Error Handling
	if (&getKnownCount == $knownValues) { 
		$fail = 1; 
		print "Error (Known Values): Cannot make progress.";
	}

}

sub getRowSummaries {
	
	my @rowSummaries = (
		[  $cells[0],$cells[1],$cells[2], $cells[3],$cells[4],$cells[5], $cells[6],$cells[7],$cells[8] ],
		[  $cells[9],$cells[10],$cells[11],$cells[12],$cells[13],$cells[14],$cells[15],$cells[16],$cells[17] ],
		[ $cells[18],$cells[19],$cells[20],$cells[21],$cells[22],$cells[23],$cells[24],$cells[25],$cells[26] ],
		
		[ $cells[27],$cells[28],$cells[29],$cells[30],$cells[31],$cells[32],$cells[33],$cells[34],$cells[35] ],
		[ $cells[36],$cells[37],$cells[38],$cells[39],$cells[40],$cells[41],$cells[42],$cells[43],$cells[44] ],
		[ $cells[45],$cells[46],$cells[47],$cells[48],$cells[49],$cells[50],$cells[51],$cells[52],$cells[53] ],

		[ $cells[54],$cells[55],$cells[56],$cells[57],$cells[58],$cells[59],$cells[60],$cells[61],$cells[62] ],
		[ $cells[63],$cells[64],$cells[65],$cells[66],$cells[67],$cells[68],$cells[69],$cells[70],$cells[71] ],
		[ $cells[72],$cells[73],$cells[74],$cells[75],$cells[76],$cells[77],$cells[78],$cells[79],$cells[80] ]
	);
	
# 	print Dumper \@rowSummaries;
	return \@rowSummaries;
	
}	

sub getColSummaries {
	
	my @colSummaries = (
		[ $cells[0],$cells[9],$cells[18],$cells[27],$cells[36],$cells[45],$cells[54],$cells[63],$cells[72] ],
		[ $cells[1],$cells[10],$cells[19],$cells[28],$cells[37],$cells[46],$cells[55],$cells[64],$cells[73] ],
		[ $cells[2],$cells[11],$cells[20],$cells[29],$cells[38],$cells[47],$cells[56],$cells[65],$cells[74] ],
		[ $cells[3],$cells[12],$cells[21],$cells[30],$cells[39],$cells[48],$cells[57],$cells[66],$cells[75] ],
		[ $cells[4],$cells[13],$cells[22],$cells[31],$cells[40],$cells[49],$cells[58],$cells[67],$cells[76] ],
		[ $cells[5],$cells[14],$cells[23],$cells[32],$cells[41],$cells[50],$cells[59],$cells[68],$cells[77] ],
		[ $cells[6],$cells[15],$cells[24],$cells[33],$cells[42],$cells[51],$cells[60],$cells[69],$cells[78] ],
		[ $cells[7],$cells[16],$cells[25],$cells[34],$cells[43],$cells[52],$cells[61],$cells[70],$cells[79] ],
		[ $cells[8],$cells[17],$cells[26],$cells[35],$cells[44],$cells[53],$cells[62],$cells[71],$cells[80] ]
	);
	
# 	print Dumper \@colSummaries;	
	return \@colSummaries;
	
}

sub getBoxSummaries {
	
	my @boxSummaries = (	
		[ $cells[0],$cells[1],$cells[2],$cells[9],$cells[10],$cells[11],$cells[18],$cells[19],$cells[20] ],
		[ $cells[3],$cells[4],$cells[5],$cells[12],$cells[13],$cells[14],$cells[21],$cells[22],$cells[23] ],
		[ $cells[6],$cells[7],$cells[8],$cells[15],$cells[16],$cells[17],$cells[24],$cells[25],$cells[26] ],
		[ $cells[27],$cells[28],$cells[29],$cells[36],$cells[37],$cells[38],$cells[45],$cells[46],$cells[47] ],
		[ $cells[30],$cells[31],$cells[32],$cells[39],$cells[40],$cells[41],$cells[48],$cells[49],$cells[50] ],
		[ $cells[33],$cells[34],$cells[35],$cells[42],$cells[43],$cells[44],$cells[51],$cells[52],$cells[53] ],
		[ $cells[54],$cells[55],$cells[56],$cells[63],$cells[64],$cells[65],$cells[72],$cells[73],$cells[74] ],
		[ $cells[57],$cells[58],$cells[59],$cells[66],$cells[67],$cells[68],$cells[75],$cells[76],$cells[77] ],
		[ $cells[60],$cells[61],$cells[62],$cells[69],$cells[70],$cells[71],$cells[78],$cells[79],$cells[80] ]
	);
	
# 	print Dumper \@boxSummaries;	
	return \@boxSummaries;
	
}

sub getPossible {
	
	my ($index, @row, @col, @box, @possible);

	$index = shift;

	@row = @{ $rowSummaries[ $rc[$index][0] - 1 ] };
	@col = @{ $colSummaries[ $rc[$index][1] - 1 ] };
	@box = @{ $boxSummaries[ $indexToBox[$index] -1 ] };

	@possible = (1,2,3,4,5,6,7,8,9);

	# Row
	foreach my $num (@row) { # NOT zero-based
		if ( ($num =~ /\d/) && ($num < 10) ) { $possible[$num -1] = undef; }
	}
	
	# Col
	foreach my $num (@col) { # NOT zero-based
		if ( ($num =~ /\d/) && ($num < 10) ) { $possible[$num -1] = undef; }
	}
		
	# Box
	foreach my $num (@box) { # NOT zero-based
		if ( ($num =~ /\d/) && ($num < 10) ) { $possible[$num -1] = undef; }
	}

# 	print Dumper \@possible;
	
	return join "", @possible;
	
# 	Note:
# 	Each cell is processing its row and column and then writing the possible values to itself.
# 	Successive cells "see" the previously set possible values of neighbor cells,ie [1|7|8],
# 	and try to remove those from @possible by setting $possible[178] = undef. When @possible
# 	is converted to the return string,the undef values at those high index aren't included.
#	I prevent this and the needless expansion of the @possible array by not undef'ing values > 9.


}

sub getCellSummary {
	my $ind = shift;

	my @charPercent = ( # One Box
		[0,0,0,0,0,0,0,0,0],# 1st Char
		[0,0,0,0,0,0,0,0,0],# 2nd Char
		[0,0,0,0,0,0,0,0,0],# ... 
		[0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0]	
	);
	
	foreach $line ( @{$boxes[$ind]} ) {
		@chars = split //,$line;
		
		foreach my $i ( 0 .. 8 ) {
			$pos = $chars[$i] - 1;
			$charPercent[$i][ $pos ] += 1;
		}
		
	}
	
	return \@charPercent; # Ref (Scalar)
}

sub outputPuzzleTSV {
	foreach $i (0 .. 80) {
		print $cells[$i];
		if  ( (($i + 1) > 0) && (($i + 1) % 9 == 0) ) {
			print "\n";
		} else {
			print "\t";
		}
	}
	
	return "";	
}

sub outputRegexBox {
	foreach my $i (0 .. 8) {
		
		print "BOX ".($i + 1)."\t".scalar @{$boxes[$i]}." Permutations\t $regexes[$i]\n";
		print &outputBoxValues($i);
		print "\n\n";		
		&outputCellSummary( &getCellSummary($i) ); # getCellSummary returns $ref,send $ref to outputCellSummary
		print "\n";
		print join ";\t",@{$boxes[$i]};
		print ";\n\n";
		
	}
	
	return "";
}

sub outputBoxValues {
	my $box = shift;
	print join "", (
		$cells[$indexesInBox[$box][0] -1], "\t", $cells[$indexesInBox[$box][1] -1], "\t", $cells[$indexesInBox[$box][2] -1], "\n", 
		$cells[$indexesInBox[$box][3] -1], "\t", $cells[$indexesInBox[$box][4] -1], "\t", $cells[$indexesInBox[$box][5] -1], "\n",
		$cells[$indexesInBox[$box][6] -1], "\t", $cells[$indexesInBox[$box][7] -1], "\t", $cells[$indexesInBox[$box][8] -1]
	);
	
	return "";
}

sub outputCellSummary {

	my ($charPercent) = @_; # @_[0] = $ref
	
	foreach $a ( @{$charPercent} ) {
		print join ",",@{$a};
		print "\n";
	}
	
	return "";

}

sub getKnownCount {
	my @unknowns = $puzzle =~ /\./g;
	return 81 - (scalar @unknowns);
}


sub testIndex {

#	OVERVIEW: Prints summary information for a position within the 0-based CSV
# 	[num,index,row,col,rows,cols,box]
# 	[28,28*,4,1,[28,29,30,31,32,33,34,35,36],[1,10,19,28,37,46,55,64,73],[28,29,30,37,38,39,46,47,48]

	my $index = shift;

	print "[num,index,row,col,rows,cols,box]\n"; # Header
	print "[$cells[$i],".($index +1)."*,". $rc[$index][0] .",".$rc[$index][1]; # Row and Col
	print ",[",( join ",", @{ $rows[ $rc[$index][0] - 1] } ), "]" ; # Row Indicies
	print ",[",( join ",", @{ $cols[ $rc[$index][1] - 1] } ), "]" ; # Col Indicies
	print ",[",( join ",", @{ $indexesInBox[ $indexToBox[$index] -1 ] } ), "]" ; # Box (9-digit permutation)
	print "\n\n";

	return "";
	
}

# END

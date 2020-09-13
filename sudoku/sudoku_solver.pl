#!/usr/bin/perl5.28


use Data::Dumper;
# $Data::Dumper::Pair = ' : ';
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

@indicies = (
	
	# Box
	[ 1, 2, 3, 4, 5, 6, 7, 8, 9],
	[10,11,12,13,14,15,16,17,18],
	[19,20,21,22,23,24,25,26,27],
	[28,29,30,31,32,33,34,35,36],
	[37,38,39,40,41,42,43,44,45],
	[46,47,48,49,50,51,52,53,54],
	[55,56,57,58,59,60,61,62,63],
	[64,65,66,67,68,69,70,71,72],
	[73,74,75,76,77,78,79,80,81],

	# Col
	[1,10,19,28,37,46,55,64,73],
	[2,11,20,29,38,47,56,65,74],
	[3,12,21,30,39,48,57,66,75],
	[4,13,22,31,40,49,58,67,76],
	[5,14,23,32,41,50,59,68,77],
	[6,15,24,33,42,51,60,69,78],
	[7,16,25,34,43,52,61,70,79],
	[8,17,26,35,44,53,62,71,80],
	[9,18,27,36,45,54,63,72,81],
	
	# Box
	[1,2,3,10,11,12,19,20,21],
	[4,5,6,13,14,15,22,23,24],
	[7,8,9,16,17,18,25,26,27],
	[28,29,30,37,38,39,46,47,48],
	[31,32,33,40,41,42,49,50,51],
	[34,35,36,43,44,45,52,53,54],
	[55,56,57,64,65,66,73,74,75],
	[58,59,60,67,68,69,76,77,78],
	[61,62,63,70,71,72,79,80,81]
);

@regexes = (
	# Row 0-8
	# Col 0-8
	# Box 0-8
	
); # 27 regular expressions

@permutations = ( # 27 lists of grepped permutations
	
	# Row 0-8
	# Col 0-8
	# Box 0-8

);

@state = (); # Save puzzle states for guessing

# END




# SECTION: 
# 	1. Read sudoku.csv
# 	2. create array of 81 known/unknown values
# 	3. each line: replace unknown (blank) values with list of possible values based on puzzle's initial known values

$guessing	= 1; # [y=1,n=2]; non-deterministic puzzles ( no single solution, etc )
$maxIterations	= 25;
$iteration	= 1;
$known		= 0;
$file		= './permutations/permutations.txt';
@file_list	= split /\n/,`cat "${file}"`;
@cells = qw(

	.	.	.	.	.	.	.	.	.
	.	.	.	.	.	.	.	.	.
	.	.	.	.	.	.	.	.	.
	.	.	.	.	.	.	.	.	.
	.	.	.	.	.	.	.	.	.
	.	.	.	.	.	.	.	.	.
	.	.	.	.	.	.	.	.	.
	.	.	.	.	.	.	.	.	.
	.	.	.	.	.	.	.	.	.

);

# Program

&outputPuzzleTSV;
&setDotCellValues;


while (
	( &getKnownCount > $known ) && 
	( &getKnownCount != 81 ) && 
	( $iteration < $maxIterations ) ) {
	
	&iterate;
	$iteration += 1;
}

sub iterate {

	$known = &getKnownCount;
	
	&outputPuzzleHeader;

	print ("\n" x 2);
	&outputPuzzleTSV;

	&setRegexes;
	&getPermutations;
	
	foreach my $i ( 0 .. 26 ) {
		&setColumnSummary( &getColumnSummary( @{$permutations[$i]} ), $indicies[$i], scalar @{$permutations[$i]} );
	}

	print ("\n" x 2);
	&outputRegexes;
	
	print ("\n" x 1);
	&outputPermutations;

	print ("\n" x 1);
	&outputPuzzleTSV;
	
	&saveState;
}


# END






# SECTION: FUNCTIONS

sub getRowSummaries {
	
	my @rowSummaries = (
		[  $cells[0], $cells[1], $cells[2], $cells[3], $cells[4], $cells[5], $cells[6], $cells[7], $cells[8] ],
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
		[ $cells[0], $cells[9],$cells[18],$cells[27],$cells[36],$cells[45],$cells[54],$cells[63],$cells[72] ],
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
		[  $cells[0], $cells[1], $cells[2], $cells[9],$cells[10],$cells[11],$cells[18],$cells[19],$cells[20] ],
		[  $cells[3], $cells[4], $cells[5],$cells[12],$cells[13],$cells[14],$cells[21],$cells[22],$cells[23] ],
		[  $cells[6], $cells[7], $cells[8],$cells[15],$cells[16],$cells[17],$cells[24],$cells[25],$cells[26] ],
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

sub getColumnSummary {

	my (@list) = @_;

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
	
	foreach my $line ( @list ) {
		my @chars = split //,$line;
		
		foreach my $i ( 0 .. 8 ) {
			my $pos = $chars[$i] - 1;
			$charPercent[$i][ $pos ] += 1;
		}
		
	}
	
	return \@charPercent; # Ref (Scalar)
}

sub getRegex {
	
	my ( @cellList ) = @_;

	$regex = "";
	foreach $index ( @cellList ) {
		#$regex .= $regex .= '['.$cells[$item -1].']'; # SLOW: w/o pipe
		$regex .= '['. ( join '|',(split //,$cells[$index -1] ) ) . ']'; # FAST: w/ pipe
	}

	return $regex;
	
}

sub getPermutations {
	
	foreach $i ( 0 .. $#regexes ) {
	
		if ( scalar @{$permutations[$i]} == 0 ) {
			
			@{$permutations[$i]} = grep { /$regexes[$i]/; } @file_list;

		} else {

			@{$permutations[$i]} = grep { /$regexes[$i]/; } @{$permutations[$i]};
		
		}

	}
	
}

sub getKnownCount {
	$puzzle = join "\t", @cells;
	my @unknowns = ($puzzle =~ /\.|\d\d+/g);
	
# 	print Dumper \@unknowns;
	
	return 81 - (scalar @unknowns);
}

sub setDotCellValues {

# 	Note:
# 
# 	This method summaries Step 1: Take the TSV from Numbers and update it with
# 	81 actual values, and summarizing the use of the methods this function depends
# 	on.
# 
# 	Optimization: Saving the values of the rows/cols/boxes is probably not
# 	a worthwhile step yet. This method is already super fast, and doing so will
# 	obstruct the iterative process that happens next. However, it will likely be
# 	possible to retrofit an optimization once I see how the intersect iteration
# 	works.

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

}

sub setRegexes {
	
	@regexes = (); # RESET list of regexes

	# Rows (x9), Cols (x9), Boxes (x9)
	foreach my $i ( 0 .. 26 ) {
		push @regexes, getRegex( @{$indicies[ $i ]} );	
	}

}

sub setColumnSummary {
	
	# 	UNDERSTANDING THE ARGUMENTS TO THIS FUNCTION
	# 
	# 	getColumnSummary(@row|col|box) READS a list of permutations for any supplied row|col|box, and returns a list of column summaries called @charPercent
	# 	setColumnSummary examines @charPercent and WRITES the column summaries to their respective cells, if they're known (non-regex) values.
	# 
	# 	getColumnSummary receives a list of permutations for a row, col, or box. An example list is below:
	# 
	# 	913 524 867
	# 	914 253 687
	# 	914 253 867
	# 
	#	"charPercent" is an array of sub-arrays, each of which is a "columnSummary" for the list of permutations.
	#
	# 	@charPercent = ( [0,0,0,0,0,0,0,0,3], [3,0,0,0,0,0,0,0,0], [0,0,1,2,0,0,0,0,0], ..., [0,0,0,0,0,0,3,0,0] )  
	# 	
	#	So ... 
	#
	# 	@columnSummary = [0,0,0,0,0,0,0,0,3] # Summary for column 1: Column 1 must be a 9, because 9 shows up all 3 times. So $indicies[0] = 9;
	# 	@columnSummary = [3,0,0,0,0,0,0,0,0] # Summary for column 2: Column 2 must be a 1, because 1 shows up all 3 times. So $indicies[1] = 1;
	# 	@columnSummary = [0,0,1,2,0,0,0,0,0] # Summary for column 3: Both 3 and 4 show up in this column. We don't know what the value is yet.
	#
	# 	... and so on, summarizing the character columns of the permutation list ... 
	#
	# 	@columnSummary = [0,0,0,0,0,0,3,0,0] # Summary for column 9: Column 9 must be a 7, because 7 shows up all 3 times. So $indicies[8] = 7;
	#
	# 
	#	Writing the values ...
	#
	# 	Column 1: WRITE $indicies[0] = 9.
	# 	Column 2: WRITE $indicies[1] = 1.
	# 	Column 3: Both 3 and 4 show up. $indicies[2] = 34, so don't update it 
	#
	#	And so on ... for all columns.
	
	#	------------------------------
	
	# 	WARNING (Getting the arguments into the function):
	#
	#	( $charPercent, $indicies, $totalPermutations ) is a LIST of the top level of @_
	#
	# 	$charPercent is a scalar REF to a LIST of scalar REF to LISTS
	#	$indicies is a REF to a LIST of scalars
	#	$totalPercent is an scalar (a 'plain integer')

	my ($charPercent, $indicies, $totalPermutations) = @_;
	my @charPercent = @{$charPercent}; # Deref LIST; Now array of scalar REFs to LISTS
	my @indicies = @{$indicies}; # Deref LIST; Now array of scalars 
	
	for my $i ( 0 .. 8 ) { # Indicies is always a 9-place array of cell indexes corresponding to a row, col or box.

		my $cellIndex = $indicies[$i] - 1; # Examples: $cellIndex = 1 is the 1st cell in the 81-cell puzzle. @indicies(1,2,3,10,11,13,19,20,21) = Column 1 of the 81-square puzzle.
		my @columnSummary = @{$charPercent[ $i ]};
		
		my $write = 0;
		my $possible = "";
		
		for my $ii ( 0 .. 8 ) { # Each index in @columnSummary
			if ( $columnSummary[$ii] > 0 ) { $possible .= ("" . ($ii + 1)) }
			if ( $columnSummary[$ii] == $totalPermutations ) {
				$write = 1;
				$cells[$cellIndex] = $ii + 1; # Set the cell to the digit when the digit occurs in every permutation.
			}
		}
		
		# The column summary produced a regex. If it's "better" than existing regex, update it.
		if ( (! $write) && ( $cells[$cellIndex] > $possible ) ) {
			$cells[$cellIndex] = $possible;
		}
		
	}
	
}

sub saveState {
	push @state, join "\t", @cells; # CSV
}

sub outputRegexes {

	my @labels = qw(
	
		Row_1	Row_2	Row_3	Row_4	Row_5	Row_6	Row_7	Row_8	Row_9
		Col_1	Col_2	Col_3	Col_4	Col_5	Col_6	Col_7	Col_8	Col_9
		Box_1	Box_2	Box_3	Box_4	Box_5	Box_6	Box_7	Box_8	Box_9
	
	);
	
	foreach $i ( 0 .. $#regexes ) {
		
		print "" . ($i + 1) . "\t$labels[$i] (" .( scalar @{$permutations[$i]} ). ")\t$regexes[$i]\n";

		if ( ($i > 0) && ($i != $#regexes) && ($i % 9) == 8 ) { print "\n"; }
		
	}

}

sub outputPermutations {
	
	my @labels = qw(
	
		Row_1	Row_2	Row_3	Row_4	Row_5	Row_6	Row_7	Row_8	Row_9
		Col_1	Col_2	Col_3	Col_4	Col_5	Col_6	Col_7	Col_8	Col_9
		Box_1	Box_2	Box_3	Box_4	Box_5	Box_6	Box_7	Box_8	Box_9
	
	);
	
	my $total_permutations = 0;
	
	foreach my $i ( 0 .. 26 ) { # 27 Permutation Lists
		
		print "\n\nIteration $iteration\tPermutations ".($i + 1) . " " . $labels[$i] . " (".( scalar @{$permutations[$i]} ).")\n";
		
		print join ";", @{$permutations[$i]}; print ";";
		
		print "\n\n";
		my @cellSummaries = @{ &getColumnSummary( @{$permutations[$i]} ) };
		
		print "Cell\t";
		print join "\t", map { $_ - 1 } @{ $indicies[$i] }; # 0-base cell indexes
		print "\n";
		foreach $r1 ( 0 .. 8 ) {
			print "\n" . ($r1 + 1);
			foreach $r2 ( 0 .. 8 ) {
				print "\t".$cellSummaries[$r2][$r1];
			}
		}
		
		print "\n";
		
		$total_permutations += scalar @{$permutations[$i]};
		
	}
	
	print "Total Permutations: $total_permutations\n";
	
	

}

sub outputPuzzleTSV {

	print "TSV (" .&getKnownCount. ") —— " . 's/(\d\d+)/\./g' . "\n";

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

sub outputPuzzleHeader {
	print ("\n" x 2);
	print ( ("=" x 50), "\n" );
	print "Puzzle Iteration ($iteration)\n";
	print ( ("=" x 50), "\n" );
}

# END
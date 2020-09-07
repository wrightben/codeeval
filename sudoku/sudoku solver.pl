#!/usr/bin/perl

# SECTION:
#	Overview: Constants for rows, cols, and 9-digit boxes.
# 	1. EXCEL: Use it to make these constants.
#	2. READ: Either inline or from external csv; See puzzle ( sudoku.csv ).

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
); # @{ $rows[&getRow($index) - 1] }

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
); # @{ $cols[&getRow($index) - 1] }

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

# Example:
# $index = 28;
# print join ", ", @{ $indexesInBox[ $indexToBox[$index] -1 ] };  # 28, 29, 30, 37, 38, 39, 46, 47, 48

# END


# SECTION: 
# 	1. Read sudoku.csv
# 	2. convert to array of integers
# 	3. process each line.
	
@lines = (<STDIN>);
chomp @lines;

$line = join ",", @lines;
@nums = split /,/g, $line;

$index = 0;
# foreach $num (@nums) {
# 	if ($num =~ /\d/) {
# 		
# 		print &testIndex($index);
# 	
# 	} elsif ( $num =~ /_/ ) {
# 
# 	}
# 	$index ++;
# }


# END








# SECTION: 
# 	Functions

sub getRow() {

	my $index = shift;
	
	return int 1 + $index / 9;

}

sub getCol($index) {

	my $index = shift;

	return int $index - ( (&getRow($index) - 1) * 9 ) + 1;

}

sub getPossible($index) {

	my $index = shift;

	@row = @{ $rows[&getRow($index) - 1] };
	@col = @{ $cols[&getCol($index) - 1] };
	@box = @{ $indexesInBox[ $indexToBox[$index] -1 ] };

	@possible = (1,2,3,4,5,6,7,8,9);

# 	foreach $i (@row) {
# 		if ( $nums[$i] =~ /\d/ ) {
# 			$possible[$nums[$i] -1] = _;
# 		}
# 	}

	
	print "\n", @possible;


}

sub testIndex() {

	my $index = shift;

	print "[num, index, row, col, rows, cols, box]\n"; # Header
	print "[$num, ".(1 + $index).", ".&getRow($index).", ".&getCol($index); # Row and Col
	print ", [", ( join ",",  @{ $rows[&getRow($index) - 1] } ),  "]" ; # Row Indicies
	print ", [", ( join ",",  @{ $cols[&getCol($index) - 1] } ),  "]" ; # Col Indicies
	print ", [", ( join ",",  @{ $indexesInBox[ $indexToBox[$index] -1 ] } ),  "]" ; # Box (9-digit permutation)
	print "\n\n";

	return "";

}

# END

#!/usr/bin/perl


# Copy-Paste from Excel
# cat 1\ -\ permutations.txt | grep -e "$(./permutations/regex_builder.pl)"

@list = qw(

9	2	68	9	9	9	4	1	5

);

chomp @list;

$regex = "";
foreach $item (@list) {
	@chars = split //, $item;
	$chars = join '|',@chars;
	$regex .= '['. $chars .']';
}

print $regex;
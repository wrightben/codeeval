#!/usr/bin/perl


# Copy-Paste from Excel
# cat 1\ -\ permutations.txt | grep -e "$(./permutations/regex_builder.pl)"

@list = qw(

24578	2457	2458	3	1458	6	57	1479	12459

);

chomp @list;

$regex = "";
foreach $item (@list) {
	@chars = split //, $item;
	$chars = join '|',@chars;
	$regex .= '['. $chars .']';
}

print $regex;
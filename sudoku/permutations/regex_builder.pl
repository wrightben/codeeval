#!/usr/bin/perl


# Copy-Paste from Excel
# cat 1\ -\ permutations.txt | grep -e "$(./permutations/regex_builder.pl)"

@list = qw(

234578
1
23458
458
458
9
6
347
245

);

chomp @list;

$regex = "";
foreach $item (@list) {
	@chars = split //, $item;
	$chars = join '|',@chars;
	$regex .= '['. $chars .']';
}

print $regex;
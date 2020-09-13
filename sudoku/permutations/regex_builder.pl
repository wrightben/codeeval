#!/usr/bin/perl


# Copy-Paste from Excel
# cat 1\ -\ permutations.txt | grep -e "$(./permutations/regex_builder.pl)"

@list = qw(

2568	2568	7	9	1	345	23458	345	2458

);

chomp @list;

$regex = "";
foreach $item (@list) {
	@chars = split //, $item;
	$chars = join '|',@chars;
	$regex .= '['. $chars .']';
}

print $regex;
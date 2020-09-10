#!/usr/bin/perl


# Copy-Paste from Excel
# cat 1\ -\ permutations.txt | grep -e "$(./permutations/regex_builder.pl)"

@list = qw(

128	9	18
12678	2678	168
3	4	5

);

chomp @list;

$regex = "";
foreach $item (@list) {
	@chars = split //, $item;
	$chars = join '|',@chars;
	$regex .= '['. $chars .']';
}

print $regex;
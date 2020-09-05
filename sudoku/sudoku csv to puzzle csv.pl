#!/usr/bin/perl

@nums = (<STDIN>);
chomp @nums;

@ints = (1,2,3,4,5,6,7,8,9);

@nospaces = map {
	s/ /,/g; 
	s/_//g;
} @nums;

print join "\n", @nums;
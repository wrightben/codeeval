#!/usr/bin/perl
use List::MoreUtils qw(uniq);

@nums = (<STDIN>);
chomp @nums;

@list = split ",", $nums[0];

@list = uniq @list;

$join = join "|", sort @list;

print "[^$join]";
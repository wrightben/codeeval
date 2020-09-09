#!/usr/bin/perl

use List::MoreUtils qw(uniq);

@perms = (<STDIN>);
chomp @perms;

@c1 = ();
@c2 = ();
@c3 = ();
@c4 = ();
@c5 = ();
@c6 = ();
@c7 = ();
@c8 = ();
@c9 = ();

foreach $perm (@perms) {
	print $perm . "\n";
	@chars = ();
	@chars = split //, $perm;
	push @c1, $chars[0];
	push @c2, $chars[1];
	push @c3, $chars[2];
	push @c4, $chars[3];
	push @c5, $chars[4];
	push @c6, $chars[5];
	push @c7, $chars[6];
	push @c8, $chars[7];
	push @c9, $chars[8];
}


print join " ", (
	printFilter( uniq @c1 ),
	printFilter( uniq @c2 ),
	printFilter( uniq @c3 ),
	printFilter( uniq @c4 ),
	printFilter( uniq @c5 ),
	printFilter( uniq @c6 ),
	printFilter( uniq @c7 ),
	printFilter( uniq @c8 ),
	printFilter( uniq @c9 )
);


print "\n\n";



sub printFilter {

	(@arr) = (@_);
	
	if (scalar @arr == 1) {
		return $arr[0];
	} else {
		return ".";
	}

}
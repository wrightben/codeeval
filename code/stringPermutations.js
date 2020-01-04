var	fs = require('fs'),
	file = process.argv[2];


var getPermutationString = function( length ) {

	// CACHED Permutation Strings
	// Performance: Very Good: 7 (real 0m0.137s), 8 (real 0m0.260s), 9 (real 0m1.378s); 9-dupes (real 0m1.616s)
	// Include cachedPermutationStrings.js to define var cachedPermutationStrings
	if ( typeof cachedPermutationStrings != "undefined" ) { return cachedPermutationStrings[ length - 1 ]; }
	
	
	var permutationIndexes = [
		[1],
		[12,21],
		[123,321],
		[1234,4321],
		[12345,54321],	
		[123456,654321],	
		[1234567,7654321],
		[12345678,87654321], 
		[123456789,987654321]
	];

	
	// REAL-TIME Permutation Strings
	// Performance: Very Good: 1-4 (real 0m0.087s), Good: 5-7 (real 0m0.212s), Fair: 8 (real 0m19.791s), Poor: 9 (real ~5m)
	var	index = length - 1,
		_s = permutationIndexes[index][0],
		_e = permutationIndexes[index][1],
		permutationString = "";
	
	
	/*	PERMUTATIONS:
		No apriori knowledge within algorithm
		9-digit limit
	*/
	for (var i = _s; i <= _e; i += 9) { // += 9 is based on Factorial Math*
		
		if ( _s == i.toString().split("").sort().join("") ) {
			permutationString += i.toString();
		}
		
	}
	
	return permutationString; // e.g. 123: 123,132,213,231,312,321
	
}


var line = function( word ) {

	var	l = word.length,
		letters = word.split("").sort(),
		ps = getPermutationString( l ).split(""),
		psArray = [];

	// Substitute letters in the permutationString
	ps.forEach(function(e,i) {
		ps[i] = letters[e - 1];
	});

	// Splitting permutationString into array of substrings
	for (var n = l; n <= ps.length ; n += l) {
		psArray.push( ps.slice( n-l , n ).join("") );
	}

	return psArray.join(",");
	
}


require('fs')
	.readFileSync( file , 'utf-8')
	.split(/\r?\n/)
	.forEach(function(word){
		console.log( line( word ), "\n" );
	})

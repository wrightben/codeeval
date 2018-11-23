var	fs = require('fs'),
	file = process.argv[2];


var isSelfDescribing = function( number ) {

	/* 	number = 1210
		n = [1,2,1,0]
		h = [_,_,_,_]
		
		Iteration 1: var i = 0, e = 1;
		h[0(i)] = "_" (= 0)
		h[1(e)] = _ (++ 1)
	*/

	var	n = number.split(""),
		h = new Array(n.length);

	n.forEach(function(e,i) { // element, iterator (0,1,...)

		if ( typeof h[i] == "undefined" ) { h[i] = 0; } // Use iterator to create zeros in h array.

		(h[e] == 1) ? h[e] += 1 : h[e] = 1; // Increment number count for symbolic int

	});

	return ( n.join("") == h.join("") ) ? 1 : 0; // ("1210" == "1210") ? 1 : 0

};


require('fs')
	.readFileSync( file , 'utf-8')
	.split(/\r?\n/)
	.forEach(function( number ) {
		console.log( isSelfDescribing( number ) );
	});
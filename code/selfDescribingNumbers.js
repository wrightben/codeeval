var	fs = require('fs'),
	file = process.argv[2];


var isSelfDescribing = function( number ) {

	var	n = number.split(""),
		h = new Array(n.length).fill(0);

	n.forEach(function(e,i) { // element, iterator (zero-based)

		h[e] += 1;

	});

	return ( n.join("") == h.join("") ) ? 1 : 0; // ("1210" == "1210") ? 1 : 0

};


require('fs')
	.readFileSync( file , 'utf-8')
	.split(/\r?\n/)
	.forEach(function( number ) {
		console.log( isSelfDescribing( number ) );
	});
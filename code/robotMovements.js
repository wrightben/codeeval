var	fs = require('fs'),
	file = process.argv[2];


var getPaths = function( gridSize, limit, debug ) {



};


require('fs')
	.readFileSync( file , 'utf-8')
	.split(/\r?\n/)
	.forEach(function( line ) {
		console.log( getPaths( 4, 1500, true ) );
	});
#!/usr/local/bin/nodegitp

var	fs = require('fs'),
	file = process.argv[2];
	
	
var selectMove = function( moves ) {
	return moves[ Math.floor( Math.random() * moves.length ) ];
}


var setPos = function( pos, board ) {

	board[ pos - 1 ] = 1;

	return pos;
}

var isValidMove = function( move, pos, gridSize, board ) {
	
	var	next = pos; // Destination

	if ( "u" == move ) {
		next -= gridSize;
		if ( next < 1  ) { return false; } // Bound
	}
	
	if ( "d" == move ) {
		next += gridSize;
		if ( next > board.length ) { return false; } // Bound
	}

	if ( "l" == move ) {
		next = pos - 1;
		if ( (next % gridSize) == 0 ) { return false; } // Bound
	}
	
	if ( "r" == move ) {
		next = pos + 1;
		if (pos % gridSize == 0) { return false; } // Bound (Note: Based on current position, not next!)
	}	

	if ( board[ next - 1 ] == 1 ) { return false; } // Already Visited

	return next;
}

var walkPath = function( pos, gridSize, board, paths ) {
	
	var	currentPath = [pos],
		dir = [ 'u', 'd', 'l', 'r' ],
		next;
	
	setPos( pos, board ); // Starting Position

	while ( true ) {
	
		// Seek Moves
		dir.next = [];
		dir.forEach(function(e,i) {
			var next = isValidMove( e, pos, gridSize, board );
			if ( Boolean(next) == true ) { dir.next.push( next ); }
		});
		
		// If
		
		// Path Blocked (No valid moves available)
		if ( dir.next.length == 0 ) { return currentPath; }
		
		// Select Move
		pos = setPos( selectMove( dir.next ), board );		
		currentPath.push(pos);
		
		// Path Complete
		if ( pos == board.length ) { return currentPath; }
		
	}

	// void
}


var getPaths = function( gridSize, limit, debug ) {

	var	board_length = Math.pow( gridSize, 2 ),
		board,
		paths = { "blocked":0, "length":0 },
		currentPath;


	while( Boolean( paths.blocked < limit ) ) {
		
		board = new Array( board_length );
		currentPath = walkPath( 1, gridSize, board, paths );
		if ( debug == true ) { console.log(currentPath.length, currentPath); }
		if ( board[ board_length - 1 ] == 1 ) {
			paths[ currentPath.join(",") ] = 1;
		} else {
			paths[ currentPath.join(",") ] = 0; // Tracking Blocked Paths
			paths.blocked += 1;
		}

	}
	
	for (var path in paths) {
		console.log(path);
	}
	
	paths.length = Object.keys( paths ).length - 2;
	return paths.length;

};


console.log( getPaths( 4, 5000, false ) );

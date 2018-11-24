#!/usr/local/bin/node

var	fs = require('fs'),
	file = process.argv[2];
	
	
var selectMove = function( moves ) {
	
	return moves[ Math.floor( Math.random() * moves.length ) ];
	
}


var setPos = function( pos, board ) {

	board[ pos - 1 ] = 1;

	return pos;
}

var isValidMove = function( move, pos, gridSize, board, currentPath, paths ) {
	
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

	if ( board[ next - 1 ] == 1 ) { return false; } // currentPath: Visited
	
	if ( typeof paths[ currentPath.join(",") + "," + next ] != "undefined" ) { return false; } // Paths: Visited (Completion or Invalid)

	return next;
}

var walkPath = function( pos, gridSize, board, paths ) {
	
	var	currentPath = [pos],
		dir = [ 'u', 'd', 'l', 'r' ];
	
	setPos( pos, board ); // Starting Position

	while ( true ) {
	
		// Seek Moves
		dir.next = [];
		dir.forEach(function(e,i) {
			var option = isValidMove( e, pos, gridSize, board, currentPath, paths );
			if ( Boolean(option) == true ) { dir.next.push( option ); }
		});
		
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


var prunePaths = function( currentPath, debug ) {

		var	prc = Object.keys(paths).length,
			ppc =  0,
			re = new RegExp('^'+currentPath.join(",")+'.');
		
		for (var i in paths) {
			if ( Boolean( re.exec( i.toString() ) ) == true  ) {
				delete paths[i];
			}
		}
		
		ppc = Object.keys(paths).length;
		
		if ( (prc > ppc) && ( debug[1] == true) ) {
			console.log("Pruned: "+( prc - ppc )+"| "+ppc+' stored paths and ' + paths.valid + ' valid');
		}
		
		return paths;
}


paths = { "blocked":0, "valid": 0 };

var getPaths = function( gridSize, prune, debug ) {

	var	board_length = Math.pow( gridSize, 2 ),
		board,
		currentPath = [],
		completedPath,
		valid = 0;

	// walkPath: If currentPath.join(",") = 1, there are no valid paths.
	while( currentPath.join(",") != "1" ) { 
		
		board = new Array( board_length );
		
		currentPath = walkPath( 1, gridSize, board, paths );
		
		completedPath = board[ board_length - 1 ];
		
		( completedPath == 1 ) ? paths.valid += 1 : paths.blocked += 1;
		
		// Prune Paths
		if ( ( currentPath.length <= prune ) && ( completedPath != 1 ) ) {
			paths = prunePaths( currentPath, debug );
		}
		
		paths[ currentPath.join(",") ] = 1;
		
		if ( debug[0] == true ) { console.log(currentPath.length, currentPath); }

	}
	
	valid = paths.valid;
	
	// # of Paths ( exclude paths = { "blocked":0 } )
	return valid;

};

console.log( getPaths( 5, 10, [true, false] ) ); // 184 (1200 ≈ 1087)
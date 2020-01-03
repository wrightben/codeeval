var	size = 4, // Grid
	grid = [ // 4 x 4 (-1 Initial)
		-1,  2,  3,  4, 
		 5,  6,  7,  8,
		 9, 10, 11, 12, 
		13, 14, 15, 16
	],
	pos = 1, // Initial
	path = [1], // Inital
	moves = [2, 5], // R, L, U, D; pos += [1, -1, size^2, -size^2]    
	paths = { "c":0, "u":0 },
	randomGuesses = 5500;  // Wrapper program finds limit by increasing this variable and/or joining sets

for (var i = 0; i < randomGuesses ; i++) {

	_grid = grid.slice();
	pos = 1;
	path = [1];
	moves = [2,5];
	
	while(  ( moves.length > 0 ) && ( pos != size * size ) ) {
	
		pos = moves[ Math.floor( Math.random() * Math.floor( moves.length ) ) ];

		_grid[pos - 1] = -1;
		path.push( pos );

		moves = [];
		[pos +1, pos -1, pos +size, pos -size].forEach(function( e, i ) {
	
			if (	// Left, Right Boundary
				((pos % size == 0) && ( e != pos + 1 )) ||
				((pos % size == 1) && ( e != pos - 1 )) ||
				( pos % size > 1 )
			) {
				// Min, Max Boundary
				if ( (e > 0) && (e < size * size + 1) && ( _grid[e - 1] != -1 ) ) {
			
					moves.push( e );
				}
			}
			
		});
	
	}
	
	path =  path.join(" "); // [] to ""
	(typeof paths[ path ] == "undefined" ) ? paths[ path ] = 1 : paths[ path ] += 1; // Hash index of path
	if ( ( pos == size * size ) && ( paths[path] == 1 ) ) { paths.c += 1; } // Increment paths.c
	if ( ( pos != size * size ) && ( paths[path] == 1 ) ) { paths.u += 1; } // Increment paths.u
	
}


console.log( paths.c );




// Distribution of Math.random()
// var	_p = [0,0,0,0];
// 
// for (i = 0; i < 100; i++) {
// 	_p[Math.floor( Math.random() * Math.floor( 4 ) )] += 1;
// }

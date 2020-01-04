var	size = 4, // Grid
	grid = [ // 4 x 4 (-1 Initial)
		-1,  2,  3,  4, 
		 5,  6,  7,  8,
		 9, 10, 11, 12, 
		13, 14, 15, 16
	],
	pos = 1, // Initial
	path = [1], // Initial
	moves = [2, 5], // R, L, U, D; pos += [1, -1, size^2, -size^2]    
	paths = { "c":0, "i":0 },
	randomGuesses = 4500;	// Wrapper program finds limit by increasing 
				// randomGuesses (setting high-water mark) and/or joining sets

for (var i = 0; i < randomGuesses ; i++) {

	_grid = grid.slice();
	pos = 1;
	path = [1];
	moves = [2,5];
	
	while(  ( moves.length > 0 ) && ( pos != size * size ) ) {
	
		pos = moves[ Math.floor( Math.random() * moves.length ) ];

		_grid[pos - 1] = -1;
		path.push( pos );

		moves = [];
		[pos +1, pos -1, pos +size, pos -size].forEach(function( e, i ) {
	
			if (	// Right, Left Boundary
				((pos % size == 0) && ( e != pos + 1 )) ||
				((pos % size == 1) && ( e != pos - 1 )) ||
				( pos % size > 1 )
			) {
				// Max, Min Boundary
				if ( (e > 0) && (e < size * size + 1) && ( _grid[e - 1] != -1 ) ) {
			
					moves.push( e );
				}
			}
			
		});
	
	}
	
	path =  path.join(" ");
	(typeof paths[ path ] == "undefined" ) ? paths[ path ] = 1 : paths[ path ] += 1; // += paths[path]
	if ( pos == size * size ) { paths.c += 1; } // += paths.c(omplete)
	else { paths.i += 1; } // += paths.i(ncomplete)
	
}

console.log( paths.c );

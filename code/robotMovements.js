var	size = 4, // Grid
	grid = new Array( size * size ).fill(0),
	pos = 1, // Initial
	path = [1], // Initial
	moves = [2, 5], // R, L, U, D; pos += [1, -1, size^2, -size^2]    
	paths = { "c":0, "i":0 },
	randomGuesses = 200;	// Wrapper program finds limit by increasing 
				// randomGuesses (setting high-water mark) and/or joining sets

for (var i = 0; i < randomGuesses; i++) {

	_grid = grid.slice();
	grid[0] = -1;
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
	
	// += paths[path]
	(typeof paths[ path ] == "undefined") ? paths[ path ] = 1 : paths[ path ] += 1; 

	// += paths.c(omplete) || paths.i(ncomplete)
	if ( paths[path] == 1 ) {
		( pos == size * size ) ? paths.c += 1 : paths.i += 1;
	}
		
}

console.log( paths.c );
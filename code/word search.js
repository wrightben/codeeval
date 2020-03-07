var findWordAtPosition = function( pos, word ) {
		
	var	_rc = getRowCol( pos ),
		_ci = [];
		
	
	var 	row = getRowLetters(_rc[0]),
		col = getColLetters(_rc[1]),
		ld = getPDiagLetters( pos ),
		rd = getNDiagLetters( pos ),
		
		rowr = row.split("").reverse().join(""),
		colr = col.split("").reverse().join(""),
		ldr = ld.split("").reverse().join(""),
		rdr =  rd.split("").reverse().join("");
	
	
	var	search = [
			row,
			col,
			ld,
			rd
		],
		rsearch = [
			rowr,
			colr,
			ldr,
			rdr
		];	
	
	
	search.forEach(function(e, i ) {
		_ci.push( e.search(word) );
	})

	
	rsearch.forEach(function(e, i ) {
		_ci.push( e.search(word) );
	})
	
	return _ci;

}


var find = function( word ) {

	var w = word.split("")[0];

	var _ci = {};
	for (var i = 0; i < index[w].length; i ++) {
		_ci[index[w][i] + " (" + getRowCol(index[w][i])[0] + "," + getRowCol(index[w][i])[1]+")"] = findWordAtPosition( index[w][i], word);
	}
	
	return _ci;
	
};


var getRowCol = function( pos ) {
	var	col = ( pos % root ) + 1,
		row = Math.floor(( pos / root )) + 1;	
	
	return [row, col];
}

var getIndex = function( row, col ) {
	return ( ( row - 1) * root ) + ( col - 1 );
}

var getRowLetters = function( row ) {
	return letters.slice( (row - 1) * root, ( (row -1) * root) + root ).join( "" );;
}
	
var getColLetters = function( col ) {

	colLetters = [ letters[col -= 1] ];
	while (colLetters.length < root) {
		colLetters.push( letters[col += root]);
	}
	return colLetters.join("");
}

// root + 1 Diagonal
var getPDiagLetters = function( pos ) {
	
	var	_ = [ letters[pos] ],
		_rc = getRowCol( pos );
		
	for (var i = pos - (root + 1); i >= 0; i -= (root + 1)) { // Seek UP-LEFT-DIAG
		if ( getRowCol(i)[1] < _rc[1] ) {
			_.unshift( letters[i] );
		}	
	}
	for (i = pos + (root + 1); i <= root * root; i += (root + 1)) { // Seek DOWN-RIGHT-DIAG
		if ( getRowCol(i)[1] > _rc[1] ) {
			_.push( letters[i] );
		}
	}
	
	return _.join("");
	
}

// root - 1 Diagonal
var getNDiagLetters = function( pos ) {
	
	var	_ = [ letters[pos] ],
		_rc = getRowCol( pos );
		
	for (var i = pos - (root - 1); i >= 0; i -= (root - 1)) { // Seek UP-RIGHT-DIAG
		if ( getRowCol(i)[1] > _rc[1] ) {
			_.push( letters[i] );
		}	
	}
	for (i = pos + (root - 1); i <= root * root; i += (root - 1)) { // Seek DOWN-LEFT-DIAG
		if ( getRowCol(i)[1] < _rc[1] ) {
			_.unshift( letters[i] );
		}
	}
	
	return _.join("");
	
}



// PREPARE THE PUZZLE

var	root,
	letters = "\
t s i r r o m s b e y e e k \
a h r a y e n b o b e p a a \
m d e h s l s z t u r t l e \
r t s m e a l s e l p e e k \
b s i s a k v e e a h i r a \
e l r t e x l e k t s y b p \
l s k c a z c e d s e a s o \
d s c r e e c h e c y e l w \
i c o e l l s j a s e a x s \
n b e l l l i t i l t t t k \
g e c k m y s d l i s a l i \
z l o s y k e e d z e e s l \
s v j m a r i o l o p e z k \
d l j j a r i i s e s j m a";


// ARRAY letters
letters = letters.split(/\s/);

root = Math.pow( letters.length, 1/2 );

console.log( "Puzzle: ", root );



// INDEX the letters
var index = {};
letters.forEach(function( e, i ) {

	(typeof index[e] == "undefined") ?
		index[e] = [i] :
		index[e].push(i);

});



// DICTIONARY of words to be found
var dict = [ // 34
	"saved", "bell", "bayside", "zack", "morris", "kelly", "kapowski", "lisa", "turtle", "screech", "jessie", "mrbelding", "mariolopez", "stacey", "themax"
].reverse(); // Longest to shortest



// FIND the words
var seek = {};
dict.forEach(function(e, i) {

	seek[e] = find( e );
	
});

console.log( JSON.stringify( seek ) );
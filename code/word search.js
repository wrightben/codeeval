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

	var w = word.split("")[0]; // Optimizable: 1. Use least-frequent letter of word; 2. (Using first or least letter) Search all words

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
// Find words in Excel using sed -e '/\s/\t/'
var	root,
	letters = "\
f i b b g n r x b x z f u c i o e p f l c a b p k \
r c e i y x n e l n w l t o b b x d u o h k g m q \
e c m n v q a a b m u l m d b c t k j u i x h w z \
s n n y s u k r r e j z e l j z r m v k l j c g d \
h u z m t g n i r i p s n i j r a c e l l f p i t \
s y c i s w e e t r g y k g y x o p r e y z d e o \
w w f t j u c d f t d l e o l r r z r p y n e h o \
b u d q w i t u n a y r o n q u d u e t e y v o f \
l s m a s x y p h o m a c f i l i h u l y l g i f \
b e j v l t t p t r b e g a z f n v p t a n n q u \
z r n d a q r c a n m r c q t r a s i f p s n t t \
h t k v z d e w e i a o i j u h r h z o b r x w b \
u m t w h n j g p g l i f g w s y l j s m b g r o \
x l d h v x n h l d e h l h h c o l o r f u l o q \
t o f p i r s k r k s s q l b t o l h e j s p a o \
d j s v o r u g e k a a i s i a l i d g a y k m i \
i o i z z x o r c f v i h q v r v o w e i a f n u \
b n e k e l i q m r x m g b w t b l u g w d s q r \
i r f h d o r d l x a c m u c b k c f x o l u n w \
g l i e r i o n v a e e q v j i x e c z v f v l j \
u n n s l p l r k j k a l s y o a e d h e e i o f \
s p a a k c g o l o o c d c z m z m h v f f d g i \
c e h h a z y x k i t x j u p u q j d y g t n f o \
s j x s p w z c b w f g h g b y w w l y l e v o l \
k u g x b t b c f n g e f y z z s u p a j a q v m";


// ARRAY letters
letters = letters.split(/\s/);

root = Math.pow( letters.length, 1/2 );


// INDEX the letters
var index = {};
letters.forEach(function( e, i ) {

	(typeof index[e] == "undefined") ?
		index[e] = [i] :
		index[e].push(i);

});



// DICTIONARY of words to be found
var dict = [ // 34
	"beautiful",
	"bright",
	"brilliant",
	"brisk",
	"chilly",
	"clear",
	"cold",
	"colorful",
	"cool",
	"dew",
	"early",
	"extraordinary",
	"fine",
	"fresh",
	"glorious",
	"golden",
	"hazy",
	"inspiring",
	"lovely",
	"soft",
	"splendid",
	"sunny",
	"sweet",
	"warm"
].sort().reverse(); // Longest to shortest



// FIND the words
var seek = {};
dict.forEach(function(e, i) {

	seek[e] = find( e );
	
});

console.log( JSON.stringify( seek ) );
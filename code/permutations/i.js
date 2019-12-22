var getNPR = function (n, r) {

	if ( ( typeof r != "number" ) || ( r > n ) ) { r = n; }

	var _ = function( n ) {
		
		var _n = n;
		
		for (var i = 1; i < _n; i ++ ) {
			n *= i;
		}
		
		if (n == 0) { n = 1; }
		
		return n;
		
	}
	
	return _(n) / _(n - r);
	
}	


// Function: _array (complex element; m (int): mask; n (int): high value
var sub = function(_array, m, n) {

	var _ = _array[0];
	var __ = [];
	
	var l = _.length;
	
	for (var i = 0; i < l; i++ ) {
		var 	_e = _[i],
			_d = m - _e;
			
		if ( _d == 0 ) {
			__[i] = m;
		} else if ( _d < 0 ) {
			__[i] = n + 1 + _d;
		} else {
			__[i] = _d;
		}
		
	}
	
	return [ __, Number(__.join("")) ];

}


// Array 1 is the complex element. Array 2 is the collection of complex elements
var inCollection = function(_array1, _array2) {

	return _array2.some(function(e,i) {
		return Boolean( e[1] == _array1[1] ); // if ( "1234" == "1234" )
	});

}


// Array 1 is the complex element. Array 2 is the collection of complex elements
var rmElement = function(_array1, _array2) {

	var	_ = [],
		l = _array2.length;
	
	for (var i = 0; i < l; i++) {
		if ( _array2[i][1] != _array1[1] ) {
			_.push( _array2[i] );
		}
	}
	return _;

}


/*******************
VARIABLES
*******************/
var 	n = 8;
//	r = 2;
	
	
// 	console.log( getNPR(n,r) );
	

var	_iph = {};
var	_ip = [];
var	_np = [];
var	_nph = {};

// Build starting array
var x = [];
for (var i = 0; i < n; i ++) { x.push(i+1); }
x = [ x, Number(x.join("")) ];
_np.push(x);
_nph[x[1]] = new Array(n+1);



while ( _np.length > 0 ) {
	
	_element = _np[0];
	
	for (var i = n + 1; i > 0; i-- ) { // 6, 5, 4, 3, 2, 1
	
		if ( _nph[_element[1]][i-1] != 1 ) {

			var ro = sub(_element,i,n); // Args: [[1,2,3,4,5,6], 123456 ], i, 4
	
			if ( ( _iph[ro[1]] != 1 ) && (! inCollection( ro, _np ) )  ) {
				_np.push( ro );
				_nph[ro[1]] = new Array(n+1);
				_nph[ro[1]][i-1] = 1;
			}
				
			_nph[_element[1]][i-1] = 1;
		}
	
	}
	
	_np = rmElement(_element, _np);
 	
 	_iph[_element[1]] = 1;
	_ip.push(_element[1]);
		
}


//	console.log(_np);
	console.log(_ip.length);
// 	console.log('_nph = ',_nph);
//	console.log(_ip);



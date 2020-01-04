// Function: _array (complex element; m (int): mask; n (int): high value
var subtract = function(s, m, n) {

	var _ = s.split("");
	var __ = [];
	
	var l = _.length;
	
	for (var i = 0; i < l; i++ ) {
		var 	_e =  _[i];
		
		if ( ( _e == "A" ) || ( _e == "B" ) || ( _e == "C" ) ) {
			_e = {
				"A":10,
				"B":11,
				"C":12,
				"D":13
			}[_e];
		}
		
		
		
		var	_d = m - _e;
			
		if ( _d == 0 ) {
			__[i] = m;
		} else if ( _d < 0 ) {
			__[i] = n + 1 + _d;
		} else {
			__[i] = _d;
		}
		
		if (__[i] > 9) {
			__[i] = {
				"10":"A",
				"11":"B",
				"12":"C",
				"13":"D"
			}[__[i].toString()];
		}
		
	}
	
	return __.join("");

}



// VARIABLES
var 	n = 7;
var	_iph = { "length": 0 }; // Hash lookup { n : 1 } //
var	_nph = { "length": 0 }; // Collection: { "length" :0, "n" : [ [](int), n ] }
var	bound = 100;


// Build starting index
var x = [];
for (var i = 0; i < n; i ++) { 
	var _num = i+1;
	if (_num > 9) {
		_num = {
			"10":"A",
			"11":"B",
			"12":"C",
			"13":"D"
		}[_num.toString()];
	}
	x.push(_num); 
}
x = x.join("");


// Add starting index to _nph
_nph[ x ] = (new Array(n+1)).fill(0);
_nph.length += 1;

console.log(_nph);

while ( _nph.length > 0 ) {

	console.log( _iph.length, _nph.length );

	
	var _ids = [];
	
	
	var _pi = 1;
	for (p in _nph) { // Max 10 ids
		if ( _nph.hasOwnProperty(p) && (p != "length") ) {		
			_ids.push( p );
		}
		if (_pi >= bound) { break; }
		_pi ++;
	}
	

	// _ids.forEach
	for (var j = 0; j < _ids.length; j++ ) {
	
		_id = _ids[j]; // (int)
		
		for (var i = n + 1; i > n - 2; i-- ) { // 6, 5, 4, 3, 2, 1

			if (_nph[ _id ][i-1] != 1) {

				var ro = subtract(_id,i,n); // Args: 123456, i, 4
	
				if ( (typeof _iph[ro] == "undefined" ) && (typeof _nph[ro] == "undefined" ) ) {
					_nph[ ro ] = (new Array(n+1)).fill(0);
					_nph[ ro ][i-1] = 1; // Mirror Status
					_nph.length += 1;
				} else if ( typeof _nph[ro] != "undefined"  ) {
					_nph[ ro ][i-1] = 1; // Mirror Status
				}
			
			}
		
		}
			
	
		_id = _ids[j];

		 // REM from _nph
		delete _nph[ _id ]; _nph.length -= 1;

		// ADD to _iph, _ip
		if ( typeof _iph[_id] == "undefined" ) {
			_iph[_id] = 1;
			_iph.length += 1;
		}
			
	
	};
	
		
}

console.log(_iph.length);
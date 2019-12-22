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


/*******************
VARIABLES
*******************/
var 	n = 10;
var	_iph = {}; // Hash lookup { n : 1 }
var	_ip = []; // [] (int): Sortable integers
var	_nph = { "length": 0 }; // Collection: { "length" :0, "n" : [ [](int), n ] }

// Build starting array
var x = [];
for (var i = 0; i < n; i ++) { x.push(i+1); }
x = [ x, Number(x.join("")) ];



_nph[ x[1] ] = [x, (new Array(n+1)).fill(0) ];
_nph.length += 1;

// console.log(getRandomID(_nph));

while ( _nph.length > 0 ) {

	var _ids = [];
	for (p in _nph) { // Max 10 ids
		if ( _nph.hasOwnProperty(p) && (p != "length") ) {
			_id = p;			
			_ids.push( _id );
		}
	}

	
	for (var i = n + 1; i > 0; i-- ) { // 6, 5, 4, 3, 2, 1
	
		for (var j = 0; j < _ids.length; j++ ) {

			_id = _ids[j];
			_element = _nph[ _id ][0];
			_status =  _nph[ _id ][1];

	
			if ( _status[i-1] != 1 ) { // Mirrored value: Skip
	
				var ro = sub(_element,i,n); // Args: [[1,2,3,4,5,6], 123456 ], i, 4
				var _roID = ro[1];
			
				if ( 	(typeof _iph[_roID] == "undefined" ) && // Not _ip
					(typeof _nph[_roID] == "undefined") ) 	// Not _np
				{
					_nph[_roID] = [ro, (new Array(n+1)).fill(0) ]; // _nph.ID = [ element, status ]
					_nph[_roID][1][i - 1] = 1; // Mirrored Value: ro.status[..i..] = 1;
					_nph.length += 1;
				} else if ( typeof _iph[ro[1]] == "undefined" ) {
					// Not completed, but mirrored
					_nph[_roID][1][i - 1] = 1; // Mirrored Value: ro.status[..i..] = 1;
				}
			
				_status[i-1] = 1; // _element.status[..i..] = 1;
			
			}

		};	
	


		
	}
	
	_ids.forEach(function(e, i) {
		
		_id = e;
		_element = _nph[ _id ][0];
		_status =  _nph[ _id ][1];
		
		 // REM from _nph
		delete _nph[ _id ]; _nph.length -= 1;
	
		// ADD to _iph, _ip
		if (typeof _iph[_id] == "undefined" ) {
			_iph[_id] = 1; // iph[ Number ] = 1
			_ip.push(_id); // _ip.push( Number )
		}
	
	});


		
}

// console.log(_nph.length, _ip.length);
console.log(_ip.length, _ip.sort());

### Use
```
perl iter.pl 3
```

#### Output
```
// n (nPr): user-defined variable
// r (nPr): Defined by # of for loops
// n cannot be less than r

( (typeof n != "number") || (n < 3) ) ? _n = 3 : _n = n;

/* 1 */ for (var i1 = 0; i1 < _n; i1++) { 
/* 2 */ for (var i2 = 0; i2 < _n; i2++) { if ((i2 != i1)) {
/* 3 */ for (var i3 = 0; i3 < _n; i3++) { if ((i3 != i2) && (i3 != i1)) {

_.push( [ i3,i2,i1 ].join("") );

}}}}}
```

#### Create a JavaScript file
```
var _ = [];


	// Insert Output Here


console.log( _.join(",") );
```
### Use
```
perl iter.pl 5
```

#### Requires
```
var _ = [];

/* Insert Output Here */

console.log( _.join(",") );
```


#### Output
```
// n (nPr): user-defined variable
// r (nPr): Defined by # of for loops
// n cannot be less than r

( (typeof n != "number") || (n < 5) ) ? _n = 5 : _n = n;

/* 1 */ for (var i1 = 0; i1 < _n; i1++) { 
/* 2 */ for (var i2 = 0; i2 < _n; i2++) { if ((i2 != i1)) {
/* 3 */ for (var i3 = 0; i3 < _n; i3++) { if ((i3 != i2) && (i3 != i1)) {
/* 4 */ for (var i4 = 0; i4 < _n; i4++) { if ((i4 != i3) && (i4 != i2) && (i4 != i1)) {
/* 5 */ for (var i5 = 0; i5 < _n; i5++) { if ((i5 != i4) && (i5 != i3) && (i5 != i2) && (i5 != i1)) {

_.push( [ i5 + 1,i4 + 1,i3 + 1,i2 + 1,i1 + 1 ].join("") );

}}}}}}}}}
```
var _ = [];


// n (nPr): user-defined variable
// r (nPr): Defined by # of for loops
// n cannot be less than r

( (typeof n != "number") || (n < 10) ) ? _n = 10 : _n = n;

/* 1 */ for (var i1 = 0; i1 < _n; i1++) { 
/* 2 */ for (var i2 = 0; i2 < _n; i2++) { if ((i2 != i1)) {
/* 3 */ for (var i3 = 0; i3 < _n; i3++) { if ((i3 != i2) && (i3 != i1)) {
/* 4 */ for (var i4 = 0; i4 < _n; i4++) { if ((i4 != i3) && (i4 != i2) && (i4 != i1)) {
/* 5 */ for (var i5 = 0; i5 < _n; i5++) { if ((i5 != i4) && (i5 != i3) && (i5 != i2) && (i5 != i1)) {
/* 6 */ for (var i6 = 0; i6 < _n; i6++) { if ((i6 != i5) && (i6 != i4) && (i6 != i3) && (i6 != i2) && (i6 != i1)) {
/* 7 */ for (var i7 = 0; i7 < _n; i7++) { if ((i7 != i6) && (i7 != i5) && (i7 != i4) && (i7 != i3) && (i7 != i2) && (i7 != i1)) {
/* 8 */ for (var i8 = 0; i8 < _n; i8++) { if ((i8 != i7) && (i8 != i6) && (i8 != i5) && (i8 != i4) && (i8 != i3) && (i8 != i2) && (i8 != i1)) {
/* 9 */ for (var i9 = 0; i9 < _n; i9++) { if ((i9 != i8) && (i9 != i7) && (i9 != i6) && (i9 != i5) && (i9 != i4) && (i9 != i3) && (i9 != i2) && (i9 != i1)) {
/* 10 */ for (var i10 = 0; i10 < _n; i10++) { if ((i10 != i9) && (i10 != i8) && (i10 != i7) && (i10 != i6) && (i10 != i5) && (i10 != i4) && (i10 != i3) && (i10 != i2) && (i10 != i1)) {

var __ = [ i10 ,i9 ,i8 ,i7 ,i6 ,i5 ,i4 ,i3 ,i2 ,i1  ];

_.push( __.join("") );

}}}}}}}}}}}}}}}}}}}



console.log( _.sort().join("\n") );
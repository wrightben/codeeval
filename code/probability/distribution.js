//Distribution of Math.random()
var	_p = new Array(4).fill(0);

for (i = 0; i < 100; i++) {
	_p[Math.floor( Math.random() * Math.floor( _p.length ) )] += 1;
}
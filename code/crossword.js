var letters = "\
b y i r e l a n d f d a o j u c r w m q p s c n c \
e r r k s h f w y y k w w p o t a t o b u y c n k \
e u a w w t l e l g t w m i i b b b n p j o x m h \
f b i g d p q s x x p g i i s q t i b i f i i f s \
s q n r f m l g o b v o s s l k d k w a a f a y i \
v f b e b c d e n r o c c d y c g n y y g s g q r \
e q o v q p e c j l m n h r d n g h s e d e z x i \
w w w o r a q r y d d b i e d x g d w n q q h i l \
g l b l o t m j p z c p e h s b b l c r u r g a t \
u z w c i f k p l c c o f p r p c o t a s n a a j \
y l d l d l a e k i c e m e r a l d t l v s l n s \
t s e e c k t k f k z x a h u t d z w b b i e o t \
m a i p m u c u c f l d v s s t e o g s s p l e o \
e p p w r i c v p p n i s n p q q o m r j f l q n \
c k c i r e m i l h i w a d o s b s t k d o i i e \
o i d t w m c y l e k k g h t e h v k n n h h m n \
c u a o a p e h r e e z g g n i d d u p p h s z r \
x p t r z u v h a s a y l j b r f l g t g h v d z \
h u c w m l v d r u k g b a q i m e l q x b y z o \
y h j t l r r r q h n t k h h a b a q y k c u l q \
n h a j h e d a r a p l g d o f g g g k y i d w v \
u a r v d y r e q i o x y g i d p n c o q i d f i \
m t k c o r m a h s u p a u b a y c k p l m j t y \
l i s o n e e r g l k q m c y g k z j c d d c d u \
h j r k s z m a w e z m x h z a t e a h o o a s f"

var dict = [ // 34
	"beef", "blarney", "bread", "cabbage", "clover", "corned", 
	"emerald", "fairies", "gaelic", "gold", "green", "hat", 
	"ireland", "irish", "isle", "leprechaun", "limerick", "lucky", 
	"march", "mischief", "of", "parade", "patrick", "pie", 
	"pot", "potato", "pudding", "rainbow", "saint", "shamrock", 
	"shepherds", "shillelagh", "snakes", "stone"
];


// ARRAY letters
letters = letters.split(/\s/);
//console.log( letters.slice(22,25) );
var root = Math.pow( letters.length , (1/2) );

console.log(letters.length, root);


// INDEX the letters
var index = {};
letters.forEach(function( e, i ) {

	(typeof index[e] == "undefined") ?
		index[e] = [i] :
		index[e].push(i);

});

// FIND the words
dict.forEach(function(e, i) {

	console.log(e);

});


var find = function( word ) {

	

};


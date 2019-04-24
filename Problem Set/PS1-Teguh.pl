% male(X) denotes that X is a male.
male(benjamin).
male(david). male(edward). male(george).
male(james). male(lucas). male(mike). male(oscar).
male(peter). male(raymond). male(umberto).

% female(X) denotes that X is female.
female(anya).
female(clara). female(fiona).
female(hannah). female(ira). female(kiana). female(nancy).
female(quincy). female(sarah). female(tina). female(victoria).

% parent(X,Y) denotes that X is one of Y's parent.
parent(anya,clara). parent(anya,edward). parent(anya,fiona).
parent(benjamin,clara). parent(benjamin,edward). parent(benjamin,fiona).

parent(clara,hannah). parent(clara,ira). parent(clara,lucas).
parent(david,hannah). parent(david,ira). parent(david,lucas).

parent(fiona,mike). parent(fiona,nancy).
parent(george,mike). parent(george,nancy).

parent(ira,peter). parent(ira,quincy).
parent(james,peter). parent(james,quincy).

parent(kiana,raymond). parent(kiana,sarah). parent(kiana,tina).
parent(lucas,raymond). parent(lucas,sarah). parent(lucas,tina).

parent(nancy,umberto). parent(nancy,victoria).
parent(oscar,umberto). parent(oscar,victoria).

married(X,Y):- parent(X,Z),parent(Y,Z),X \== Y.

is_a_grandson(X):- male(X),parent(Y,X),parent(_,Y).
is_a_granddaughter(X):- female(X),parent(Y,X),parent(_,Y).

brother(X,Y):- parent(W,X),parent(W,Y),male(X), X\==Y.
sister(X,Y):- parent(W,X),parent(W,Y),female(X),X\==Y.

uncle(X,Y):-( parent(Z,X),parent(Z,W),(brother(W,X);sister(W,X)),parent(W,Y));(parent(_,W),married(W,X),((brother(W,Z);sister(W,Z)),parent(Z,Y)),male(X)).

aunt(X,Y):-( parent(Z,X),parent(Z,W),(brother(W,X);sister(W,X)),parent(W,Y));(parent(_,W),married(W,X),((brother(W,Z);sister(W,Z)),parent(Z,Y)),female(X)).


is_a_nephew(X):- male(X),(uncle(_,X);aunt(_,X)).
is_a_niece(X):- female(X),(uncle(_,X);aunt(_,X)).


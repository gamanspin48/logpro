male(bob).
male(charlie).
male(david).
male(hans).
male(jim).
female(alice).
female(emma).
female(fiona).
female(grace).
female(irene).
female(kelly).
female(lily).
% parent(x,y) states that x is a parent of y
parent(alice,charlie).
parent(bob,charlie).
parent(bob,emma).
parent(charlie,fiona).
parent(charlie,grace).
parent(emma,irene).
parent(fiona,david).
parent(fiona,lily).
parent(grace,jim).
parent(grace,kelly).
parent(hans,jim).
parent(hans,kelly).
% adult(x) states that x is an adult.
% Alice, Bob, Charlie, Emma, Fiona, Grace, & Hans are adults.
adult(alice).
adult(bob).
adult(charlie).
adult(emma).
adult(fiona).
adult(grace).
adult(hans).
% teen(x) states that x is a teenager.
% Irene, David, & Lily are teenagers.
teen(irene).
teen(david).
teen(lily).
% kid(x) states that x is a little child.
% Jim & Kelly are little children.
kid(jim).
kid(kelly).

gentleman(X):- male(X),adult(X).
lady(X):- female(X), adult(X).
teen_boy(X):- male(X), teen(X).
teen_girl(X):- female(X), teen(X).
little_boy(X):- male(X), kid(X).
little_girl(X):- female(X), kid(X).

lovesFIFA17(X):- teen_boy(X);little_boy(X).
lovesCandyCrush(X):- teen_girl(X);little_girl(X).

child(X,Y):- parent(Y,X).

father(X,Y):- parent(X,Y), male(X).
mother(X,Y):- parent(X,Y), female(X).

grandparent(X,Y):- parent(X,Z),parent(Z,Y).
has_a_child(X):- parent(X,_).

is_a_mommy(X):- mother(X,_).
is_a_daddy(X):- father(X,_).

sibling(X,Y):- parent(Z,X),parent(Z,Y),X \== Y.

brother(X,Y):- sibling(X,Y), male(X),X \== Y.
sister(X,Y):- sibling(X,Y), female(X),X \== Y.
cousin(X,Y):- sibling(W,Z),parent(W,X),parent(Z,Y),X \== Y.
uncle(X,Y):- child(Z,X),child(Z,W),(sibling(X,V);sibling(W,V)),parent(V,Y),male(X).

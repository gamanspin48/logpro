contain(katarina,olga).
contain(olga,natsha).
contain(natsha,irina).

contains(X,Y):- contain(X,Y).
contains(X,Y):- contain(X,Z), contains(Z,Y).

greater_than(s(_),0).
greater_than(s(X),s(Y)):- greater_than(X,Y).
greater_than(s(X),Y):- greater_than(X,Y).


add3andtimes2(X,Y):- Y is (X+3)*2.

double(X,Y):- number(X),Y is 2*X.
double(X,Y):- number(Y),var(X),X is Y/2.
average(X,Y,Z):- number(X),number(Y),Z is (X+Y)/2.
average(X,Y,Z):- number(X),number(Z),var(Y),Y is Z*2-X.
average(X,Y,Z):- number(Z),number(Y),var(X),X is Z*2-Y.

distance(point(X1,Y1),point(X2,Y2),Z):-
    Z is sqrt((X1-X2)**2+(Y1-Y2)**2).

strange_square(X,Y):-
between(10,99,X),
between(1000,9999,Y),
X**2 =:= Y,
X =:= Y div 100 + Y mod 1000.

sumseries(1,N):- N is 1.
sumseries(M,N):- number(M),M =\= 1.


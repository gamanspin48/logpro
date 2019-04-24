addone([],[]).
addone([H1|T1],[H2|T2]):- number(H2),H1 is H2+1,addone(T1,T2).
addone([H1|T1],[H2|T2]):- number(H1),H2 is H1+1,addone(T1,T2).

sameElemList([H|T]):- accsameElemList([H|T],H).
accsameElemList([A],A).
accsameElemList([H|T],H):- accsameElemList(T,H).
scalarMult(_,[],[]).
scalarMult([],_,[]).


scalarMult(X,[H|T],[H2|T2]):- number(H), H2 is H*X,
    scalarMult(X,T,T2).
scalarMult(X,[H|T],[H2|T2]):- number(H2), H is H2*X,
    scalarMult(X,T,T2).
scalarMult(X,[H|T],[H2|T2]):- var(X), X is H2/H,
    scalarMult(X,T,T2).


add(L1,L2,"dimension error"):- length(L1,X), length(L2,Y), X =\= Y.
add([],[],[]).
add([H1|T1],[H2|T2],[H3|T3]):-
    length([H1|T1],X), length([H2|T2],Y), X =:= Y,
    H3 is H1+H2, add(T1,T2,T3).

accdot([],[],X,X).
accdot([H1|T1],[H2|T2],A,X):-
    B is (H1*H2)+A, accdot(T1,T2,B,X).

dot(L1,L2,"dimension error"):- length(L1,X),length(L2,Y), X =\= Y.
dot(L1,L2,X):-
    length(L1,Z),length(L2,Y), Z =:=Y,
       accdot(L1,L2,0,X).








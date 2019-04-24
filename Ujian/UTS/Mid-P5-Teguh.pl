:- op(600, xf, genap).
X genap:-
    MODX is X mod 2,
    MODX =:= 0.

:- op(600, xf, ganjil).
X ganjil:-
    MODX is X mod 2,
    MODX =:= 1.


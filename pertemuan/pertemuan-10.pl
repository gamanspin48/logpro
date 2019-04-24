squeeze :- get0(C), put(C), dorest(C).
dorest(46) :- !. % 46 is ASCII code for "."
dorest(32) :- !, get(C), % skip other blanks
put(C), dorest(C).
dorest(_) :- squeeze.

displaylist([]).
displaylist([L|LL]) :- writeline(L), nl, displaylist(LL).
writeline([]).
writeline([H|T]) :- write(H), tab(2), writeline(T).

makelower:- get0(C),dorest2(C).
dorest2(46):- !.
dorest2(X):- X >= 65, X =< 90, N is X+32, put(N),get0(C),dorest2(C).
dorest2(X):- put(X),get0(C),dorest(C).

membership(X,[X|_]).
membership(X,[H|Tail]):- H =\=X,membership(X,Tail).
concate([],L,L).
concate([X|L1],L2,[X|L3]):- concate(L1,L2,L3).
len([],0).
len([_|Tail],N):- len(Tail,M), N is M+1.
membership1(X,L):- concate([],[X|L],[X|L]).
membership1(X,L):- concate(_,[X|_],L).
membership1(X,L):- concate(_,[X],L).
writeall([]).
writeall([H|T]):- write(H),nl,writeall(T).
a_to_b([],[]).
%a_to_b(X,Y):- len(X,XL),len(Y,XL).
a_to_b([a|T1],[b|T2]):- a_to_b(T1,T2).
permute([],[]).
permute([X|L],L2):- permute(L,T1),insert(X,T1,L2).
remove(X,[X|T],T).
remove(X,[H|T1],[H|T2]):- remove(X,T1,T2).
insert(X,L1,L2):- remove(X,L2,L1).
tran(eins,one).
tran(zwei,two).
tran(drei,three).
tran(vier,four).
tran(fuenf,five).
tran(sechs,six).
tran(sieben,seven).
tran(acht,eight).
tran(neun,nine).
listtran([],[]).
listtran([H1|T1],[H2|T2]):- tran(H1,H2),listtran(T1,T2).
twice([],[]).
twice([H1|T1],[H1,H1|T2]):- twice(T1,T2).
combine1([],[],[]).
combine1([H1|T1],[H2|T2],[H1,H2|T3]):-
    combine1(T1,T2,T3).
combine2([],[],[]).
combine2([H1|T1],[H2|T2],[[H1,H2]|T3]):-
    combine2(T1,T2,T3).

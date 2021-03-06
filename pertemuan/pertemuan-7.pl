accmaxlist([],A,A).
accmaxlist([H|T],A,Max):-
    H > A,
    accmaxlist(T,H,Max).
accmaxlist([H|T],A,Max):-
    H =< A,
    accmaxlist(T,A,Max).

max([H|T],Max):- accmaxlist([H|T],H,Max).

sumlist([],0).
sumlist([H|T],Sum):-
   sumlist(T,SumT),
   Sum is H+SumT.
prodlist([],1).
prodlist([H|T],Prod):-
   prodlist(T,ProdT),
   Prod is H*ProdT.
prefix(P,L):-
    append(P,_,L).
suffix(S,L):-
    append(_,S,L).
sublist(Sub,L):-
    prefix(P,L),
    suffix(Sub,P).
sublist2(Sub,L):-
    suffix(S,L),
    prefix(Sub,S).
naiveReverse([],[]).
naiveReverse([H|T],R):-
naiveReverse(T,RT),
    append(RT,[H],R).
accReverse([],A,A). % The base case for the empty list.
accReverse([H|T],A,R):- accReverse(T,[H|A],R).
reverseList(L1,L2):- accReverse(L1,[],L2).

doubled(L):- append(L1,L1,L).
palindrome(L):- reverse(L,L2),append([],L2,L).
putfirst(X,L1,[X|L1]).
putlast(X,L1,L2):- append(L1,[X],L2).
age(john,45).
age(mary,28).
age(michael,62).
age(henry,23).
age(george,62).
age(bill,17).
age(martin,62).
under_30(L):-
    age(N,X),
    X < 30,
    findall(N,age(N,_),L).


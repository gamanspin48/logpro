theSum:- theSumACC(0).
theSumACC(X):- number(X),
   write('Enter a number or finish to end:'), read(N),
   number(N), B is N+X, theSumACC(B).


numeral(0).
numeral(s(X)):- numeral(X).
notdivisibleby3(X):- X > 0.

expectation(L,R):- expectationACC(L,1,0,R).
expectationACC([],_,R,R).
expectationACC([H|T],P,Q,R):-
    S is H*P,P1 is P+1,U is S+Q,
   % write(T),write(P1),write(R),
    expectationACC(T,P1,U,R).

writelist([]).
writelist([H|T]):- write(H),writelist(T).

binaryACC(0,[]).
binaryACC(Q,L):-
    A is Q mod 2,
    L1 = [A|_],
    append(L,L1,L2),
    Q is A div 2,
    binaryACC(Q,L2).

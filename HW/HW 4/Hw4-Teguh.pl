%no 1
use_module(library(quintus)).
prodlist([],1).
prodlist([H|T],Prod):-
   prodlist(T,ProdT),
   Prod is H*ProdT.

arithmean(L,A):-
    sumlist(L,SL), length(L,LL),
    A is SL / LL.

geomean(L,A):-
   prodlist(L,PL), length(L,LL),
   pow(PL,1/LL,A).
%no 2
gcd1(0,0,D):- write("gcd error"),number(D).
gcd1(A,B,D):- A =\= 0,B =:= 0, D = A.
gcd1(A,B,D):- A =:= 0,B =\= 0, D = B.
gcd1(A,B,D):- A =< B, A=\=0, B=\=0, B1 is B-A, gcd1(A,B1,D).
gcd1(A,B,D):- A > B,A=\=0, B=\=0, A1 is A-B, gcd1(A1,B,D).

lcm1(A,B,D):- gcd1(A,B,G),D is (A * B)/G.

gcd([H],H):- !.
gcd([H|T],X):- length(T,LT),LT=1,T = [H1|_], gcd1(H,H1,X),!.
gcd([H|T],X):- gcd(T,X1), gcd1(H,X1,X).


lcm([H],H):- !.
lcm([H|T],X):- length(T,LT),LT=1,T = [H1|_], lcm1(H,H1,X),!.
lcm([H|T],X):- lcm(T,X1), lcm1(H,X1,X).

%no 3
isPrime(2):- !.
isPrime(3):- !.
isPrime(N):- N > 3, M is N mod 2, M = 1,
   SN is floor(sqrt(N)),isPrimeAcc(N,3,SN).
isPrimeAcc(_,I,SN):- I >= SN,!.
isPrimeAcc(N,I,SN):-
   I < SN,
   Mod is N mod I,Mod \= 0,
   J is I + 2, isPrimeAcc(N,J,SN).

prime_listacc(BB,BA,L,L):- BB > BA.
prime_listacc(BB,BA,L1,L2):-
   BB =< BA,
   isPrime(BA),
   BA1 is BA - 1,
   prime_listacc(BB,BA1,[BA|L1],L2),!.
prime_listacc(BB,BA,L1,L2):-
   BB =< BA,
   BA1 is BA - 1,
   prime_listacc(BB,BA1,L1,L2).
prime_list(BB,BA,L):- BB =< BA,
   prime_listacc(BB,BA,[],L),!.
prime_list(BB,BA,L):- BB >= BA,
   prime_listacc(BA,BB,[],L).

%no 4
splitacc([],_,P1,P2,P1,P2).
splitacc([H|T],X,P1,P2,P3,P4):- H >= X,splitacc(T,X,[H|P1],P2,P3,P4),!.
splitacc([H|T],X,P1,P2,P3,P4):- H < X,splitacc(T,X,P1,[H|P2],P3,P4).
split(L,X,P1,P2):- splitacc(L,X,[],[],Q1,Q2), reverse(Q1,P1),reverse(Q2,P2).

%no 5
neighbor(L,R,[L,R|_]).
neighbor(L,R,[_|T]):- neighbor(L,R,T).


own_zebra_nationality(X):-
   Street = [_H1,_H2,_H3],
   member(house(red,english,_),Street),
   member(house(_,spanish,jaguar),Street),
   neighbor(house(_,_,snail),house(_,japan,_),Street),
   neighbor(house(_,_,snail),house(blue,_,_),Street),
   member(house(_,X,zebra),Street),write("Street = "),write(Street),nl,!.

house_color_japanese(X) :-
   Street = [_H1,_H2,_H3],
   member(house(red,english,_),Street),
   member(house(_,spanish,jaguar),Street),
   neighbor(house(_,_,snail),house(_,japan,_),Street),
   neighbor(house(_,_,snail),house(blue,_,_),Street),
   member(house(_,Y,zebra),Street),
   own_zebra_nationality(Y),
   member(house(X,japan,_),Street),write("Street = "),write(Street),nl,!.

green_color_nationality(X):-
   Street = [_H1,_H2,_H3],
   house_color_japanese(Z),
   member(house(red,english,_),Street),
   member(house(_,spanish,jaguar),Street),
   neighbor(house(_,_,snail),house(Z,japan,_),Street),
   neighbor(house(_,_,snail),house(blue,_,_),Street),
   member(house(_,Y,zebra),Street),
   own_zebra_nationality(Y),
   member(house(green,X,_),Street),write("Street = "),write(Street),nl,!.

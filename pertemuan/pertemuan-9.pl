grade_convert1(G):- G > 80, write('A').
grade_convert1(G):- G > 70, write('AB').
grade_convert1(G):- G > 65, write('B').
grade_convert1(G):- G > 60, write('BC').
grade_convert1(G):- G > 50, write('C').
grade_convert1(G):- G > 40, write('D').
grade_convert1(G):- G >= 0, write('E').

grade_convert2(G):- G > 80, write('A').
grade_convert2(G):- G > 70, G =< 80, write('AB').
grade_convert2(G):- G > 65, G =< 70, write('B').
grade_convert2(G):- G > 60, G =< 65, write('BC').
grade_convert2(G):- G > 50, G =< 60, write('C').
grade_convert2(G):- G > 40, G =< 50, write('D').
grade_convert2(G):- G >= 0, G =< 40, write('E').

grade_convert3(G):- G > 80, write('A'), !.
grade_convert3(G):- G > 70, G =< 80, write('AB'), !.
grade_convert3(G):- G > 65, G =< 70, write('B'), !.
grade_convert3(G):- G > 60, G =< 65, write('BC'), !.
grade_convert3(G):- G > 50, G =< 60, write('C'), !.
grade_convert3(G):- G > 40, G =< 50, write('D'), !.
grade_convert3(G):- G >= 0, G =< 40, write('E'), !.


p(X):- a(X).
p(X):- b(X),c(X),d(X),e(X).
p(X):- f(X).

a(1).
b(1).
b(2).
c(1).
c(2).
d(2).
e(2).
f(3).

s(X,Y):- q(X,Y).
s(0,0).
q0(X,Y):- i(X),j(Y).
q1(X,Y):- i(X),!,j(Y).
i(1).
i(2).
j(1).
j(2).
j(3).

% variant 1
wizard1(harry) :- !.
wizard1(ron).
wizard1(hermione).
% variant 2
wizard2(harry).
wizard2(ron) :- !.
wizard2(hermione).
% variant 3
wizard3(harry).
wizard3(ron).
wizard3(hermione) :- !.

max(X,Y,X):- X >= Y ,!.
max(X,Y,Y):- X < Y.

maximum(X,Y,Z):- (
X =< Y -> Z = Y;
Z = X
).

membership1(X,[X|_]):- !.
membership1(X,[_|T]):- membership(X,T).

add_term1(X,L,L):- member(X,L),!.
add_term1(X,L,[X|L]).

parity_test(N,odd):- Mod is N mod 2, Mod =2.
parity_test(N,even):- number(N).


parity:-
    repeat,
    write('Enter next number: '), read(N),
    parity_test(N,Type),
    write(N), write(' is '), write(Type), nl, N =:= 9999.



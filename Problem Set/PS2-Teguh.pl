max3numbers(X,Y,Z):-
    number(X),number(Y),number(Z),
    X >= Y, X >= Z, write(X).
max3numbers(X,Y,Z):-
    number(X),number(Y),number(Z),
    Y >= X, Y >= Z, write(Y).
max3numbers(X,Y,Z):-
    number(X),number(Y),number(Z),
    Z >= Y, Z >= X, write(Z).

mypromise(1):- write('I will study hard for the midterm.'),nl.
mypromise(N):- N >= 1, write('I will study hard for the midterm.'),nl,mypromise(N-1).

factorial(0,1).
factorial(N,F):-
    N>0,N1 is N-1,factorial(N1,F1),F is N*F1.

sumcube(0,0).
sumcube(1,1).
sumcube(M,N):- M > 1, M1 is M-1,
    sumcube(M1,N1),
    N is N1+(M**3).

directTrain(forbach,saarbruecken).
directTrain(freyming,forbach).
directTrain(fahlquemont,stAvold).
directTrain(stAvold,forbach).
directTrain(saarbruecken,dudweiler).
directTrain(metz,fahlquemont).
directTrain(nancy,metz).

travelBetween(X,Y):- directTrain(X,Y).
travelBetween(X,Y):- directTrain(X,Z),travelBetween(Z,Y).
travelBetween(X,Y):- travelBetween(Y,X).



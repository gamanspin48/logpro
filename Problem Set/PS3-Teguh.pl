triangle(X,Y,Z):- X >0,Y>0,Z>0.
triangle(X,Y,Z):- (X+Y) > Z,(Z+X) > Y, (Y+Z) > X.
tribo(0,0).
tribo(1,1).
tribo(2,2).
tribo(N,M):- N >= 3,  N1 is N-1,
    tribo(N1,M1), N2 is N-2, tribo(N2,M2),
    N3 is N-3, tribo(N3,M3), M is (1*M1)+(2*M2)+(3*M3).

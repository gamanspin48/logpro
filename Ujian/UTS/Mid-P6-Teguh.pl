primtriple(A,B,C):-
    0 < A, A < B, B < C,
    A2 is A^2,
    B2 is B^2,
    C2 is C^2,
    A2B2 is A2+B2,
    C2 =:= A2B2.
ptriangle(A,B,N):-
    NDIV is N/2,
    (A < NDIV;B < NDIV).
ptriangle(A,B,C,N):-
    N is A+B+C.

ppt(T,MIN,MAX):-
    between(MIN,MAX,A),
    between(MIN,MAX,B),
    between(MIN,MAX,C),
    primtriple(A,B,C),
    ptriangle(A,B,MAX),
    ptriangle(A,B,C,N),
    N < MAX,T = (A,B,C).


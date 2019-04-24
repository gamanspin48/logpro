printBintang(1):- write(" *"),nl.
printBintang(N):- N > 1,write(" *"),N1 is N-1, printBintang(N1).
printSpace(1):- write(" ").
printSpace(N):- N>1,N1 is N-1, write(" "),printSpace(N1).

triangles(1,N):- printBintang(N).
triangles(M,N):- M > 1,M1 is M-1,O is N - M1,printSpace(M1),printBintang(O),triangles(M1,N).
triangle(N):- triangles(N,N).



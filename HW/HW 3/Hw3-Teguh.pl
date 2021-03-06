%no 1
seqDays(legi,pahing).
seqDays(pahing,pon).
seqDays(pon,wage).
seqDays(wage,kliwon).
seqDays(kliwon,legi).

day(D,2,P):- seqDays(D,P).
day(D,N,P):- N > 2, N1 is N-1,seqDays(D,P1),day(P1,N1,P).

%no 2
printBintang(1):- write("* "),nl.
printBintang(N):- N > 1,write("* "),N1 is N-1, printBintang(N1).
printSpace(1):- write("  ").
printSpace(N):- N>1,N1 is N-1, write("  "),printSpace(N1).


%2.1
inverttri(1):- printBintang(1).
inverttri(N):- N>1,printBintang(N),N1 is N-1,inverttri(N1).

%2.2
startril(1,N):- printBintang(N).
startril(M,N):- M > 1,M1 is M-1,O is N - M1,printBintang(O),startril(M1,N).
startri(N):- startril(N,N).

%2.3
tristarl(1,N):- printBintang(N).
tristarl(M,N):- M > 1,M1 is M-1,O is N - M1,printSpace(M1),printBintang(O),tristarl(M1,N).
tristar(N):- tristarl(N,N).

%no 3
byCar(auckland,hamilton).
byCar(hamilton,raglan).
byCar(valmont,saarbruecken).
byCar(valmont,metz).
byTrain(metz,frankfurt).
byTrain(saarbruecken,frankfurt).
byTrain(metz,paris).
byTrain(saarbruecken,paris).
byPlane(frankfurt,bangkok).
byPlane(frankfurt,singapore).
byPlane(paris,losAngeles).
byPlane(bangkok,auckland).
byPlane(losAngeles,auckland).

canTravel(X,Y):- byCar(X,Y);byTrain(X,Y);byPlane(X,Y).
travelable(X,Y):- canTravel(X,Y).
travelable(X,Y):- (canTravel(X,Z)),travelable(Z,Y).
travelwhere(X,Y,go(X,Y)):- canTravel(X,Y).
travelwhere(X,Y,go(X,Z,W)):-canTravel(X,Z),travelable(Z,Y),travelwhere(Z,Y,W).
travelhow(X,Y,go(X,Y,car)):- byCar(X,Y).
travelhow(X,Y,go(X,Y,train)):- byTrain(X,Y).
travelhow(X,Y,go(X,Y,plane)):- byPlane(X,Y).
travelhow(X,Y,go(X,Z,car,W)):- byCar(X,Z),travelable(Z,Y),travelhow(Z,Y,W).
travelhow(X,Y,go(X,Z,train,W)):- byTrain(X,Z),travelable(Z,Y),travelhow(Z,Y,W).
travelhow(X,Y,go(X,Z,plane,W)):- byPlane(X,Z),travelable(Z,Y),travelhow(Z,Y,W).



%no 4
gcd(0,0,D):- write("gcd error"),number(D).
gcd(A,B,D):- A =\= 0,B =:= 0, D is A.
gcd(A,B,D):- A =:= 0,B =\= 0, D is B.
gcd(A,B,D):- A =< B, A=\=0, B=\=0, B1 is B-A, gcd(A,B1,D).
gcd(A,B,D):- A >= B,A=\=0, B=\=0, A1 is A-B, gcd(A1,B,D).


%no 5
:- op(650, xfx, suka).
alia suka mie.
alia suka bakso.
alia suka rendang.
alia suka eskrim.
bambang suka bakso.
bambang suka sate.
bambang suka coklat.
bambang suka eskrim.
caca suka sate.
caca suka mie.
caca suka bakso.
caca suka coklat.
dani suka bakso.
dani suka sate.
dani suka rendang.
dani suka eskrim.
X suka Y dan Z:- X suka Y, X suka Z.

:- op(700,xfy,dan).
X dan Y:- X,Y.



%no 6
euler(1,1).
euler(N,X):- N > 1, N1 is N-1,euler(N1,X1),
    X is X1+(1/N**2).
approxpi(N,X):- N > 1, euler(N,X1),X is sqrt(6*X1).

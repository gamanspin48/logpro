%no1
go((X,Y),n,(X,Y1)):- number(Y),Y1 is Y+1,!.
go((X,Y),n,(X,Y1)):- number(Y1),Y is Y1-1.
go((X,Y),s,(X,Y1)):- number(Y),Y1 is Y-1,!.
go((X,Y),s,(X,Y1)):- number(Y1),Y is Y1+1.
go((X,Y),e,(X1,Y)):- number(X), X1 is X+1,!.
go((X,Y),e,(X1,Y)):- number(X1), X is X1-1.
go((X,Y),w,(X1,Y)):- number(X),X1 is X-1,!.
go((X,Y),w,(X1,Y)):- number(X1),X is X1+1.

%no2
goto(X,L,X1):- var(X1),length(L,1),L = [H|_], go(X,H,X1),!.
goto(X,[H|T],X1):- var(X1), go(X,H,X2), goto(X2,T,X1).





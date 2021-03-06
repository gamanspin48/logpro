%no1
go((X,Y),n,(X,Y1)):- number(Y),Y1 is Y+1,!.
go((X,Y),n,(X,Y1)):- number(Y1),Y is Y1-1,!.
go((X,Y),s,(X,Y1)):- number(Y),Y1 is Y-1,!.
go((X,Y),s,(X,Y1)):- number(Y1),Y is Y1+1,!.
go((X,Y),e,(X1,Y)):- number(X), X1 is X+1,!.
go((X,Y),e,(X1,Y)):- number(X1), X is X1-1,!.
go((X,Y),w,(X1,Y)):- number(X),X1 is X-1,!.
go((X,Y),w,(X1,Y)):- number(X1),X is X1+1,!.


%no2
goto(X,L,X1):- var(X1),length(L,1),L = [H|_], go(X,H,X1),!.
goto(X,[H|T],X1):- var(X1), go(X,H,X2), goto(X2,T,X1),!.

%no3
goto(X,L,X1):- var(X),length(L,1),L = [H|_], go(X,H,X1),!.
goto(X,L,X1):- var(X),reverse(L,LR),
      LR = [H|T],
      reverse(T,TR),
    go(X2,H,X1), goto(X,TR,X2),!.

%no4
getdir((X,Y),n,(X,Y1)):- Y < Y1.
getdir((X,Y),s,(X,Y1)):- Y > Y1.
getdir((X,Y),e,(X1,Y)):- X < X1.
getdir((X,Y),w,(X1,Y)):- X > X1.
getdir((X1,Y1),n,(X2,Y2)):-
      XS is X1 - X2,YS is Y1 - Y2,
      YS >= XS, YS < 0.
getdir((X1,Y1),s,(X2,Y2)):-
      XS is X1 - X2,YS is Y1 - Y2,
      YS >= XS, YS > 0.
getdir((X1,Y1),e,(X2,Y2)):-
      XS is X1 - X2,YS is Y1 - Y2,
      XS >= YS, XS < 0.
getdir((X1,Y1),w,(X2,Y2)):-
      XS is X1 - X2,YS is Y1 - Y2,
      XS >= YS, XS > 0.

countPath((X,Y),(X,Y),D,D):- !.
countPath((X1,Y1),(X2,Y2),C,D):-
        getdir((X1,Y1),H,(X2,Y2)), D1 is C+1,
        go((X1,Y1),H,(X3,Y3)),
        countPath((X3,Y3),(X2,Y2),D1,D).

shortdistance(X,L,D):- goto(X,L,R), countPath(X,R,0,D).

%no5
isCorrectPath((X,Y),(X,Y),[]):- !.
isCorrectPath((X1,Y1),(X2,Y2),[H|T]):-
      getdir((X1,Y1),H,(X2,Y2)),
      go((X1,Y1),H,(X3,Y3)),isCorrectPath((X3,Y3),(X2,Y2),T).

countPathList((X,Y),(X,Y),L,L):- !.
countPathList((X1,Y1),(X2,Y2),L1,L2):-
        getdir((X1,Y1),H,(X2,Y2)),
        go((X1,Y1),H,(X3,Y3)),
        L3 = [H],
        append(L1,L3,L4),
        countPathList((X3,Y3),(X2,Y2),L4,L2).

shortpath(X,L,stay):-
      goto(X,L,X).
shortpath(X,L,Path):-
       goto(X,L,R),countPathList(X,R,[],Path),isCorrectPath(X,R,Path).













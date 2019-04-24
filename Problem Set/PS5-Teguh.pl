grade_convert1(end,"You Choose To End Program"):- !.
grade_convert1(G,"Please Try Again!"):- atom(G),!.
grade_convert1(G,"Please Try Again!"):- number(G),(G > 100; G <0),!.
grade_convert1(G,"A"):- G > 80,!.
grade_convert1(G,"AB"):- G > 70,!.
grade_convert1(G,"B"):- G > 65,!.
grade_convert1(G,"BC"):- G > 60,!.
grade_convert1(G,"C"):- G > 50,!.
grade_convert1(G,"D"):- G > 40,!.
grade_convert1(G,"E"):- G >= 0.

igc:-
    repeat,
    write('Write a number between 0 - 100 (inclusive) or a string "end" without quotes: '),nl, read(N),
    grade_convert1(N,Idx),
    write(Idx),nl, N = end.
monotone([_]).
monotone(L):- monotoneup(L),monotonedown(L).
monotoneup([_]).
monotoneup([H|T]):- T = [H1|T1], H =< H1,monotoneup(T1).
monotonedown([_]).
monotonedown([H|T]):- T = [H1|T1], H >= H1,monotonedown(T1).

sumlist([],0).
sumlist([H|T],Sum):-
   sumlist(T,SumT),
   Sum is H+SumT.

hamming(L1,L2,X):- hamminglist(L1,L2,L3),sumlist(L3,X).
hamminglist([],[],[]).
hamminglist([H|T],[H|T1],[0|T2]):- hamminglist(T,T1,T2),!.
hamminglist([_|T],[_|T1],[1|T2]):- hamminglist(T,T1,T2).

accmaxlist([],A,A).
accmaxlist([H|T],A,Max):-
    H > A,
    accmaxlist(T,H,Max).
accmaxlist([H|T],A,Max):-
    H =< A,
    accmaxlist(T,A,Max).

max([H|T],Max):- accmaxlist([H|T],H,Max).

isOdd(N):- Mod is N mod 2, Mod = 1.
maxodd(L,M):- maxoddacc(L,L2), max(L2,M).
maxoddacc([],[]).
maxoddacc([H|T],L):- isOdd(H),L = [H|T1], maxoddacc(T,T1),!.
maxoddacc([_|T],L):- maxoddacc(T,L).





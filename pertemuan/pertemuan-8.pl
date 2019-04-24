%Loop(0).
loop(N):-
N>0,write("The value is: "),write(N),nl,
M is N-1,loop(M).

output_values(M,M):- write(M).
output_values(M,N):- M < N, write(M),nl, M1 is M +1, output_values(M1,N).
output_values(M,N):- M > N, output_values(N,M).


start_example1:- example1(start).
%start is a dummy value used to get the looping process started
example1(end).
example1(X):-
X \= end,
write("Type end to end: "), read(Word),
write("Input was "), write(Word), nl,
example1(Word).

start_asking:- ask_decision(maybe).
%ask_decision(no).
%ask_decision(yes).
ask_decision(X):- (X == yes; X == no),
     write("answer is "),write(X),nl,
     write("X = "),write(X).
ask_decision(X):- (X \= yes; X \= no),
    write("answer yes or no: "), read(Word),
    ask_decision(Word).

readterms(Infile):-
seeing(S),see(Infile),
repeat,read(X),write(X),nl,X = end,
seen,see(S).

menu:- input(start).

valid(a,"A").
valid(b,"B").
valid(c,"C").

input(start):-
    display,
    read(Input),
    input(Input).
input(X):-
    (X \= a, X \= b, X \= c, X\= d),
    write("Please Try Again!"),nl,
    input(start).
input(X):-
    X == d,
    write('You chose to end program, goodbye!').
input(X):-
    valid(X,N),
    write("You chose choice "),write(N),nl,
    input(start).
display:-
    write('Choose one of the following menu'),nl,
    write('a. Choice A'),nl,
    write('b. Choice B'),nl,
    write('c. Choice C'),nl,
    write('d. End Program'),nl.

dog(fido).
dog(fred).
dog(jonathan).
cat(tom).
cat(sylvester).
cat(steven).

alldogs:- dog(X), write(X), write(' is a dog'),nl.
%alldogs.

alldogsv1:- dog(X), write(X), write(' is a dog'),nl, fail.
%alldogsv1.

person(john,smith,45,london,doctor).
person(martin,williams,33,birmingham,teacher).
person(henry,smith,26,manchester,plumber).
person(jane,wilson,62,london,teacher).
person(mary,smith,29,glasgow,surveyor).

allteachers:- person(X,Y,_,_,teacher),
    write(X),write(" "),write(Y),nl,fail.

profession40:- person(_,_,A,_,X),
    A >= 40, write(X),nl,fail.

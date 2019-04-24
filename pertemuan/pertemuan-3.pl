animal(mammal,tiger,carnivore,stripes).
animal(mammal,hyena,carnivore,ugly).
animal(mammal,lion,carnivore,mane).
animal(mammal,zebra,herbivore,stripes).
animal(bird,eagle,carnivore,large).
animal(bird,sparrow,scavenger,small).
animal(reptile,snake,carnivore,long).
animal(reptile,lizard,scavenger,small).

/* Dating Agency Database */
person(bill,male).
person(george,male).
person(alfred,male).
person(carol,female).
person(margaret,female).
person(jane,female).

mammal(X):- animal(mammal,X,_,_).
mammal_carnivore(X):- animal(mammal,X,carnivore,_).
mammal_stripes(X):- animal(mammal,X,_,stripes).
reptile_mane(X):- animal(reptile,X,_,mane).

couple(X,Y):- person(X,GenX),person(Y,GenY),GenX \== GenY.

%date(D,M,2019) = date(E,feb,Y),date(D,M,2019) = date(9,M,Y).
%date(D,M,2019) = date(D1,feb,Y),
%date(D,M,2019) = date(1,M,Y).
%k(Z,f(X,b,Z)) = k(h(X),f(g(a),Y,Z)).
%date(1,feb) = date(Day, Month, Year).
%k(s(g),Y) = k(X,t(k)).
%k(s(g),t(k)) = k(X,t(Y)).
%loves(X,X) = loves(marsellus,mia).

word(article,a). word(article,every).
word(noun,criminal). word(noun,'beef burger').
word(verb,eats). word(verb,likes).

sentences:- word(article,A),word(noun,B),word(verb,C),word(article,D),word(noun,E),
    write(A),write(" "),
    write(B),write(" "),
    write(C),write(" "),
    write(D),write(" "),
    write(E),write(" ").

direct(jakarta,yogyakarta).
direct(jakarta,surabaya).
direct(jakarta,bali).
direct(bandung,yogyakarta).
direct(bandung,surabaya).
direct(bandung,bali).
direct(surabaya,makassar).
direct(makassar,manado).

numeral(0).
numeral(succ(X)):- numeral(X).
add(0,X,X). add(X,0,X).
add(succ(X),Y,succ(Z)):- add(X,Y,Z).
add(X,succ(Y),succ(Z)):- add(X,Y,Z).

flight1(X,Y):- direct(X,Y).
flight1(X,Y):- direct(X,Z), flight1(Z,Y).
% original version
flight2(X,Y):- direct(X,Y).
flight2(X,Y):- flight2(Z,Y), direct(X,Z).
% swap clauses of the second definition for flight1
flight3(X,Y):- direct(X,Y).
flight3(X,Y):- direct(Z,Y), flight3(X,Z).
% another modification of flight1
flight4(X,Y):- direct(X,Y).
flight4(X,Y):- flight4(X,Z), direct(Z,Y).
% swap clauses of the second definition for flight 3

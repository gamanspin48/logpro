%woman(mia).
%woman(jody).
%woman(yolanda).
%playsAirGuitar(jody).

%listensToMusic(mia).
%happy(yolanda).
%playsAirGuitar(mia) :- listensToMusic(mia).
%playsAirGuitar(yolanda) :- listensToMusic(yolanda).
%listensToMusic(yolanda):- happy(yolanda).

%happy(vincent).
%listensTomusic(butch).
%playsAirGuitar(vincent):- listensTomusic(vincent),happy(vincent).
%sama seperti or
%playsAirGuitar(butch):- happy(butch).
%playsAirGuitar(butch):- listensTomusic(butch).

%woman(mia).
%woman(jody).
%woman(yolanda).
%loves(vincent,mia).
%loves(marcellus,mia).
%loves(pumpkin,honey_bunny).
%loves(honey_bunny,pumpkin).

%loves(vincent,mia).
%loves(marsellus,mia).
%loves(pumpkin, honey_bunny).
%loves(honey_bunny, pumpkin).
%jealous(X,Y):- loves(X,Z), loves(Y,Z), X \== Y.

%wizard(harry).
%wizard(ron).
%wizard(hermione).
%muggle(uncle_vernon).
%muggle(aunt_petunia).
%chases(crookshanks, scabbars).

%kicking(dudley,harry).
%eating(dudley).
%happy(aunt_petunia) :- happy(dudley).
%happy(uncle_vernon) :- happy(dudley), unhappy(harry).
%happy(dudley) :- kicking(dudley,harry).
%happy(dudley) :- eating(dudley).

%father(albert,james).
%father(james,harry).
%mother(ruth,james).
%mother(lili,harry).
%wizard(lili).
%wizard(ruth).
%wizard(albert).
%wizard(X):-
%father(Y,X),wizard(Y),
%mother(Z,X),wizard(Z).

dog(fido). dog(rover). dog(jane).
dog(tom). dog(fred). dog(henry).
cat(mary). cat(harry). cat(bill). cat(steve).
large(fido). large(mary). large(tom).
large(fred). large(steve). large(jim). large(mike).
large_animal(X):- dog(X), large(X).
large_animal(Y):- cat(Y), large(Y).


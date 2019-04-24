male(ajim).
male(ohid).
female(zai).
female(konka).
man(zohari).
woman(shira).

%name height eyecolor haircolor
person(shojib,5.6,black,black).
person(shohel,6,brown,black).
person(konka,5.6,black,brown).
person(ohid,6,black,black).

position("Shojib",lecturer).
position('shohel','Senior Lecturer').
find_position:-
		write('Whose position do you wish to know?'),nl,
		read(Input),nl,
		position(Input,Output),nl,
		write(Output).


go:- write('Write the number '),nl,
		read(X),nl,read(Y),nl,
		com(X,Y).

com(X,Y):- X>Y,write('X is Bigger Value');X<Y,write('Y is Bigger Value').
isMale(Nama):- male(Nama),string_concat(Nama,' adalah laki-laki',Final),write(Final).

likes(dan,sally).
likes(sally,dan).
likes(josh,britney).

dating(X,Y):-
likes(X,Y),
likes(Y,X).

friendship(X,Y):-
likes(X,Y);likes(Y,X).

weather(phoenix,summer,hot).
weather(la,summer,warm).
weather(phoenix,winter,warm).

warmer_than(C1,C2):-
weather(C1,summer,hot),
weather(C2,summer,warm),
write(C1),write(' is warmer then '),write(C2),nl.

course(

	cse110,
	day(mon,wed),
	time(11,12),
	prof(holton,bryce),
	coor105

).

course(

	cse110,
	day(mon,wed),
	time(11,12),
	prof(holton,bryce),
	coor321

).

instructor(Instructor,Class):-

	course(Class,
			_,
			_,
			Instructor,
			_).
			
ate(Person, grilledcheese):-
    ate(Person,cheese),
    ate(Person,bread).

ate2(Person,grilledcheese):-
    ate(Person,cheese1),
    ate(Person,cheese2).

avg_temp(phx,100).
avg_temp(sf,68).

avg_temp_cels(Location,C_temp):-
    avg_temp(Location,F_temp),
    C_temp is (F_temp-32)*5/9.

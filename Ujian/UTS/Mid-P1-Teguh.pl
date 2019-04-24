% parent(X,Y) denotes that X is one of Y’s parent
parent(anya,clara). parent(anya,edward). parent(anya,fiona).
parent(benjamin,clara). parent(benjamin,edward). parent(benjamin,fiona).
parent(clara,hannah). parent(clara,ira). parent(clara,lucas).
parent(david,hannah). parent(david,ira). parent(david,lucas).
parent(fiona,mike). parent(fiona,nancy).
parent(george,mike). parent(george,nancy).
parent(ira,peter). parent(ira,quincy).
parent(james,peter). parent(james,quincy).
parent(kiana,raymond). parent(kiana,sarah). parent(kiana,tina).
parent(lucas,raymond). parent(lucas,sarah). parent(lucas,tina).
%page 5 of 15

%Midterm Exam 2019 1 PAKDE, BUDE, PAKLIK, AND BULIK
parent(nancy,umberto). parent(nancy,victoria).
parent(oscar,umberto). parent(oscar,victoria).
/* person(Person,Gender,Birthyear) explains that the person Person is
of gender Gender and born at Birthyear */
person(anya,female,1938). person(benjamin,male,1929).
person(clara,female,1959). person(david,male,1950).
person(edward,male,1963).
person(fiona,female,1965). person(george,male,1955).
person(hannah,female,1980).
person(ira,female,1982). person(james,male,1979).
person(kiana,female,1990). person(lucas,male,1989).
person(mike,male,1991).
person(nancy,female,1994). person(oscar,male,1992).
person(peter,male,2005). person(quincy,female,2008).
person(raymond,male,2013). person(sarah,female,2015).
person(tina,female,2018).
person(umberto,male,2016). person(victoria,female,2019).

siblings(X,Y):- parent(Z,X),parent(Z,Y).
male(X):- person(X,male,_).
female(X):- person(X,female,_).

married(X,Y):- parent(X,Z),parent(Y,Z), X \== Y.
olderBrother(X,Y):- siblings(X,Y), person(X,male,TX),person(Y,_,TY),
    TX < TY.
olderSister(X,Y):- siblings(X,Y), person(X,female,TX),person(Y,_,TY),
    TX < TY.
littleBrother(X,Y):- siblings(X,Y), person(X,male,TX),person(Y,_,TY),
    TX > TY.
littleSister(X,Y):- siblings(X,Y), person(X,female,TX),person(Y,_,TY),
    TX > TY.

pakde(X,Y):- olderBrother(X,Z), parent(Z,Y).
pakde(X,Y):- parent(Z,Y), olderSister(V,Z), married(X,V).
paklik(X,Y):- littleBrother(X,Z), parent(Z,Y).
paklik(X,Y):- parent(Z,Y), littleSister(V,Z), married(X,V).
bude(X,Y):- olderSister(X,Z), parent(Z,Y).
bude(X,Y):- parent(Z,Y), olderBrother(V,Z), married(X,V).
bulik(X,Y):- littleSister(X,Z), parent(Z,Y).
bulik(X,Y):- parent(Z,Y), littleBrother(V,Z), married(X,V).


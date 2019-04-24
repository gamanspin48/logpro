% male(X) denotes that X is a male.
male(benjamin).
male(david). male(edward). male(george).
male(james). male(lucas). male(mike). male(oscar).
male(peter). male(raymond). male(umberto).

% female(X) denotes that X is female.
female(anya).
female(clara). female(fiona).
female(hannah). female(ira). female(kiana). female(nancy).
female(quincy). female(sarah). female(tina). female(victoria).

% parent(X,Y) denotes that X is one of Y's parent.
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

parent(nancy,umberto). parent(nancy,victoria).
parent(oscar,umberto). parent(oscar,victoria).

% birth(X,Y) explains the birth year of person X.
birth(anya,1938). birth(benjamin,1929).

birth(clara,1959). birth(david,1950).
birth(edward,1963).
birth(fiona,1965). birth(george,1962).

birth(hannah,1980).
birth(ira,1982). birth(james,1979).
birth(kiana,1990). birth(lucas,1986).

birth(mike,1991).
birth(nancy,1994). birth(oscar,1992).

birth(peter,2005). birth(quincy,2008).
birth(raymond,2013). birth(sarah,2015). birth(tina,2018).

birth(umberto,2016). birth(victoria,2019).

brother_in_law(X,Y):- parent(W,Y),parent(W,Z),
                      parent(X,V),parent(Z,V),
                      male(X),(parent(S,X),not(parent(S,Y));
                             not(parent(_,X))).
brother_in_law(X,Y):- parent(W,X), parent(W,Z),
                      parent(Z,V),parent(Y,V),
                      male(X),parent(S,X),not(parent(S,Y)).
brother_in_law(X,Y):- parent(W,Z),parent(W,U),
                      parent(Z,V),parent(X,V),
                      parent(U,T),parent(Y,T),
                      male(X).
sister_in_law(X,Y):- parent(W,Y),parent(W,Z),
                      parent(X,V),parent(Z,V),
                      female(X),(parent(S,X),not(parent(S,Y));
                             not(parent(_,X))).
sister_in_law(X,Y):- parent(W,X), parent(W,Z),
                      parent(Z,V),parent(Y,V),
                      female(X),parent(S,X),not(parent(S,Y)).
sister_in_law(X,Y):- parent(W,Z),parent(W,U),
                      parent(Z,V),parent(X,V),
                      parent(U,T),parent(Y,T),
                      female(X),parent(S,X),not(parent(S,Y)).
son_in_law(X,Y):- parent(X,W),parent(Z,W),
                  parent(Y,Z),male(X).
daughter_in_law(X,Y):- parent(X,W),parent(Z,W),
                  parent(Y,Z),female(X).
father_in_law(X,Y):- (son_in_law(Y,X);daughter_in_law(Y,X)),
                      male(X).
mother_in_law(X,Y):- (son_in_law(Y,X);daughter_in_law(Y,X)),
                      female(X).
older(X,Y):- birth(X,TahunX),birth(Y,TahunY),
             TahunX < TahunY.
younger(X,Y):- older(Y,X).
xiaodidi(X,Y):- parent(Z,X),parent(Z,Y),
                male(X),younger(X,Y).
xiaomeimei(X,Y):- parent(Z,X),parent(Z,Y),
                female(X),younger(X,Y).


childOf(maria, claudia).
childOf(claudia, berta).
female(maria).
female(claudia).
female(berta).
grandchildOf(X,Z) :- childOf(X,Y), childOf(Y,Z).
mother(X) :- female(X), childOf(_,X).
male(X) :- not(female(X)).
descendantOf(X,Y) :- descendantOf(Z,Y), childOf(X,Z).
descendantOf(X,Y) :- childOf(X,Y).

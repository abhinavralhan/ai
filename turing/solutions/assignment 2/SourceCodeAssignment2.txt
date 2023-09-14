childOf(maria, claudia).
childOf(claudia, berta).
childOf(caroline, berta).
childOf(carl, berta).
childOf(michael, claudia).

female(caroline).
female(maria).
female(claudia).
female(berta).

grandchildOf(X,Z) :- childOf(X,Y), childOf(Y,Z).
mother(X) :- female(X), childOf(_,X).
male(X) :- not(female(X)).

siblingOf(X,Y):-childOf(X,Z), childOf(Y,Z), X\==Y.
auntOf(X,Y):-female(X), siblingOf(X,Z), childOf(Y,Z).


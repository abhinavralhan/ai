% Step 1: Define predicates
argument(a1).
argument(a2).
argument(a3).
argument(a4).
argument(a5).

attacks(a1, a2).
attacks(a2, a1).
attacks(a2, a3).
attacks(a3, a4).
attacks(a4, a5).
attacks(a5, a4).
attacks(a5, a3).

% Step 2: Generate all possible subsets
s(A) :- not -s(A), argument(A).
-s(A) :- not s(A), argument(A).

% Step 3: Define defeated and undefended predicates
defeated(A) :- attacks(A, B), s(B).
undefended(A) :- attacks(B, A), s(B), not defeated(B).

% Step 4: Ensure conflict-free and admissible extensions
:- s(A), s(B), attacks(A, B).
:- s(A), s(B), attacks(B, A).
:- s(A), argument(A), undefended(A).

% Step 5: Specify complete extensions
complete :- s(A), argument(A), not undefended(A).
:- not complete.

#show s/1.


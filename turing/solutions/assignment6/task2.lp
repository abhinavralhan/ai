time(0..10).

fluent(walking).
fluent(loaded).
fluent(dead).
literal(F)      :- fluent(F).
literal(neg(F)) :- fluent(F).
contrary(F, neg(F)) :- fluent(F).
contrary(neg(F), F) :- fluent(F).

holds(walking, 0).
holds(neg(loaded),0).
holds(neg(dead), 0).

action(load).
action(shoot).

% 1
:- walking, not walking.

% 2
holds(walking, 0) :- holds(walking, 0), not holds(walking, 0).

% 3
possible(shoot, 0) :- holds(loaded, -1).
possible(load, 0) :- not holds(loaded, -1).

% 4
-performed(load, 0) :- action(load), time(0), not possible(load, 0).
performed(load, 0) :- action(load), time(0), not possible(load, 0), not -performed(load, 0).

% 5
holds(loaded, 1) :- performed(shoot, 0), action(shoot, _, dead), member(loaded, dead).
holds(loaded, 1) :- holds(loaded, 0), not deleted(loaded, 1).

deleted(loaded, 1) :- performed(shoot, 0), action(shoot, _, dead), member(neg(loaded), dead).
deleted(loaded, 1) :- deleted(loaded, 0), not holds(loaded, 1).


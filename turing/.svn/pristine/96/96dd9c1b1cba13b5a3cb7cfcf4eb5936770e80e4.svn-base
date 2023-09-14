% Define the initial state
initial_state([[2, 3], [0, 1]]).

% Define the goal state
goal_state([[1, 2], [3, 0]]).

% Define the valid moves
move([[A, B], [C, 0]], [[A, B], [0, C]]). % Move the tile down
move([[A, 0], [C, B]], [[A, C], [0, B]]). % Move the tile right
move([[0, A], [C, B]], [[C, A], [0, B]]). % Move the tile left
move([[A, B], [0, C]], [[A, B], [C, 0]]). % Move the tile up

% Define the search algorithm
search(State, _, []) :- goal_state(State).
search(State, Visited, [Move | Moves]) :-
    move(State, NextState),
    \+ member(NextState, Visited), % Avoid loops
    search(NextState, [NextState | Visited], Moves),
    Move = NextState.

% Predicate to solve the puzzle
solve_puzzle(Moves) :-
    initial_state(InitialState),
    search(InitialState, [InitialState], Moves).

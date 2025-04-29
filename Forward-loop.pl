forward_loop(N1, N2):-
    N1 =< N2,
    write(N1), nl,
    Next is N1+1,
    forward_loop(Next, N2).

forward_loop(_,_).

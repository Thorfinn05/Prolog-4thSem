last1([X], X).
last1([_|T], X):-
    last1(T, X).

init([_], []).
init([H|T], [H|R]):-
    init(T, R).

left_right(L, R):-
    last1(L, Last),
    init(L, List),
    R = [Last | List].

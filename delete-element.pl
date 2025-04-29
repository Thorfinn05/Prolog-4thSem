delete1(_,[],[]).
delete1(X, [X|T], T).
delete1(X, [H|T], [H|D]):-
    delete1(X, T, D).


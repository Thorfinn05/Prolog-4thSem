length1([], 0).
length1([_|T], L):-
    length1(T, L1),
    L is L1+1.

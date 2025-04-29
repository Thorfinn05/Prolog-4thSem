list_order([]).
list_order([_]).
list_order([X,Y|T]):-
    X=<Y,
    list_order([Y|T]).

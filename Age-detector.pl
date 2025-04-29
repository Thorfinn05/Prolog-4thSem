person(john, smith, 45, london, doctor).
person(martin, wiliams, 33, birmingham, teacher).
person(henry, smith, 26, manchester, plumber).
person(jane, wilson, 62, london, teacher).
person(mary, smith, 29, glasgow, surveyor).
age_40:-
    person(FN, LN, Age, _, Prof),
    Age >= 40,
    write(FN), write(' '), write(LN), write(' is a '), write(Prof), nl,
    fail.
age_40.

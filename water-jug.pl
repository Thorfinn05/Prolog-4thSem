waterjug(X,Y):- X>4, Y<3, write('4L jug overflowed'), nl.
waterjug(X,Y):- X<4, Y>3, write('3L jug overflowed'), nl.
waterjug(X,Y):- X>4, Y>3, write('Both jugs are overflowed'), nl.

waterjug(X,Y):-
    (X=:=0, Y=:=0, nl, write('4L:0 & 3L:3 (Action: Fill 3L jug)'), YY is 3, waterjug(X, YY));
    (X=:=2, Y=:=0, nl, write('4L:2 & 3L:0 (Action: Goal state is reached)'));
    (X=:=0, Y=:=3, nl, write('4L:3 & 3L:0 (Action: Pour water from 3L to 4L)'), XX is 3, YY is 0, waterjug(XX,YY));
    (X=:=3, Y=:=0, nl, write('4L:3 & 3L:3 (Action: Fill 3L jug)'), YY is 3, waterjug(X, YY));
    (X=:=3, Y=:=3, nl, write('4L:4 & 3L:2 (Action: Pour water from 3L to 4L untill 4l jug is filled)'), XX is X+1, YY is Y-1, waterjug(XX, YY));
    (X=:=4, Y=:=2, nl, write('4L:0 & 3L:2 (Action: Empty the 4l jug)'), XX is 0, waterjug(XX, Y));
    (X=:=0, Y=:=2, nl, write('4l:2 & 3L:0 (Action: pour water from 3L to 4L)'), XX is 2, YY is 0, waterjug(XX, YY));
    (X=:=0, Y=:=0, nl, write('4L:4 & 3L:0 (Action: Fill 4L jug)'), XX is 4, waterjug(XX, Y));
    (X=:=4, Y=:=0, nl, write('4l:1 & 3l:3 (Action; Pour water from 4L to 3L)'), XX is X-3, YY is 3, waterjug(XX, YY));
    (X=:=1, Y=:=3, nl, write('4L:1 & 3L:0 (Action: Empty 3L jug)'), YY is 0, waterjug(X, YY));
    (X=:=1, Y=:=0, nl, write('4L:0 & 3l:1 (Action: pour water from 4l to 3l)'), XX is 0, YY is 1, waterjug(XX, YY));
    (X=:=0, Y=:=1, nl, write('4L:4, 3L:1 (Action: Fill thge 4L jug)'), XX is 4, waterjug(XX, Y));
    (X=:=4, Y=:=1, nl , write('4L:2 & 3L:3 (Action: Pour water from 4L to 3l jug)'), XX is X-2, YY is Y+2, waterjug(XX, YY));
    (X=:=2, Y=:=3, nl, write('4L:2 & 3L:0 (Action: Empty 3L jug)'), YY is 0, waterjug(X, YY)).




parent(pam, bob).
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).
parent(bob, peter).
forward_loop(N1, N2):-
    N1=<N2,
    write(N1), nl,
    Next is N1+1,
    forward_loop(Next, N2).
forward_loop(_,_).
backward_loop(N1, N2):-
    N1>=N2,
    write(N1), nl,
    Next is N1-1,
    backward_loop(Next, N2).
backward_loop(_,_).
loop_cond(N):-
    N<10,
    write(N), nl,
    New is N+1,
    loop_cond(New).
loop_cond(_).

factorial(0, 1).
factorial(N, F):-
    N>0,
    N1 is N-1,
    factorial(N1, F1),
    F is F1*N.
cal:-
    write('Enter a number: '), read(N), nl,
    factorial(N, F),
    write('factorial: '), write(F), nl.

sum(0,0).
sum(N, S):-
    N>0,
    N1 is N-1,
    sum(N1, S1),
    S is S1+N.
calc:-
    write('Enter a no.: '), read(N), nl,
    sum(N, S),
    write('Sum: '), write(S), nl.

squares(N1, N2):-
    N1=<N2,
    Square is N1*N1,
    write('Square of'), write(N1), write(': '), write(Square), nl,
    Next is N1+1,
    squares(Next, N2).
squares(_,_).
calS:-
    write('Enter no.: '), read(N1),
    write('Enter no.: '), read(N2),
    squares(N1, N2).

mem_check(X, [X|_]).
mem_check(X, [_|T]):-
    mem_check(X, T).

len([], 0).
len([_|T], L):-
    len(T, L1), L is L1+1.

conca([], L, L).
conca([H|T], L, [H|R]):-
    conca(T, L, R).

del(_, [], []).
del(X, [X|T], T).
del(X, [H|T], [H|R]):-
    del(X, T, R).

ins(X, L, [X|L]).
ins(X, [H|T], [H|R]):-
    ins(X, T, R).

sor([]).
sor([_]).
sor([X,Y|T]):-
    X=<Y,
    sor(Y|T).

sum1([], 0).
sum1([H|T], S):-
    sum1(T, S1), S is S1+H.

eve([]).
eve([_,_|T]):-
    eve(T).

rev([], []).
rev([H|T], R):-
    rev(T, RevT), concat(RevT, [H], R).

left([H|T], R):-
    concat(T, [H], R).

%Tower of Hanoi
move(1, From, To, _) :-
    write('Move disk from '), write(From), write(' to '), write(To), nl.

move(N, From, To, Aux) :-
    N > 1,
    M is N - 1,
    move(M, From, Aux, To),
    move(1, From, To, _),
    move(M, Aux, To, From).

%DFS-BFS
graph(a,b).
graph(a,c).
graph(b,d).
graph(b,e).
graph(c,f).
graph(c,e).
goal(f).
goal(g).
mem_chk(X, [X|_]).
mem_chk(X, [_|T]):-
        mem_chk(X, T).
solve(Node, Solution):-dfs([], Node, Solution).
dfs(Path, Node, [Node|Path]):- goal(Node).
dfs(Path, Node, Solution):-
    graph(Node, Next),
    not(member(Next, Path)),
    dfs([Node|Path], Next, Solution).

solve_bfs(Start, Solution):-
    bfs([[Start]], Solution).
bfs([[Node|Path]|_], [Node|Path]):-
    goal(Node).
bfs([[Node|Path]|RestPaths], Solution):-
    findall([Next, Node|Path],
            (   graph(Node, Next), not(member(Next, [Node|Path]))),
            newPaths),
    append(RestPaths, newPaths, UpdatedQueue),
    bfs(UpdatedQueue, Solution).

%Waterjug
waterjug(X,Y):- X>4, Y=<3, write('4L jug is overloaded'),nl.
waterjug(X,Y):- X=<4, Y>3, write('3L jug is overloaded'), nl.
waterjug(X,Y):- X>4, Y>3, write('Both jugs are overloaded'), nl.

waterjug(X, Y):-
    (X=:=2, Y=:=0, nl, write('4L:2, 3L:0 (Action: Goal state reached)'));
    (X=:=0, Y=:=0, nl, write('4L:0, 3L:3 (Action: Fill 3L jug)'), YY is 3, waterjug(X, YY));
    (   X=:=0, Y=:=3, nl, write('4L:3 & 3L:0 (Action: Pour water from 3L jug to 4L jug)'), XX is 3, YY is 0, waterjug(XX, YY));
    (   X=:=3, Y=:=0, nl, write('4L:3 & 3L:3 (Action: Fill the 3L jug)'), YY is 3, waterjug(X, YY));
    (   X=:=3, Y=:=3, nl, write('4L:4 & 3L:2 (Action: Pour water from 3L to 4L untill 4L is filled)'), XX is X+1, YY is Y-1, waterjug(XX, YY));
    (   X=:=4, Y=:=2, nl, write('4L:0 & 3L:2 (Action: Empty the 4L jug)'), XX is 0, waterjug(XX, Y));
    (   X=:=0, Y=:=2, nl, write('4L:2 & 3L:0 (Action: Pour water from 3L jug to 4L jug)'), XX is Y, YY is X, waterjug(XX, YY));



    (X=:=0, Y=:=0, nl, write('4L:4, 3L:0 (Action: Fill 4L jug)'), XX is 4, waterjug(XX, Y));
    (   X=:=4, Y=:=0, nl, write('4L:1 & 3L:3 (Action: Pour water from 4L jug to 3L jug until filled)'), XX is X-3, YY is 3, waterjug(XX, YY));
    (   X=:=1, Y=:=3, nl, write('4L:1 & 3L:0 (Action:Empty the 3L jug)'), YY is 0, waterjug(X, YY));
    (   X=:=1, Y=:=0, nl, write('4L:0 & 3L:1 (Action: Pour water from 4L to 3L)'), XX is 0, YY is X, waterjug(XX, YY));
    (   X=:=0, Y=:=1, nl, write('4L:4 & 3L:1 (Action: Fill 4L jug)'), XX is 4, waterjug(XX, Y));
    (   X=:=4, Y=:=1, nl, write('4L:2 & 3L:3 (Action: Pour water from 4L to 3L)'), XX is X-2, YY is Y+2, waterjug(XX, YY));
    (   X=:=2, Y=:=3, nl, write('4L:2 & 3L:0 (Action: Empty the 3L jug)'), YY is 0, waterjug(X, YY)).

move1(1, From, To, _):-
    write("Move from "), write(From), write(" to "), write(To), write("."), nl.
move1(N, From, To, Aux):-
    N>1,
    M is N-1,
    move1(M, From, Aux, To),
    move1(1, From, To, _),
    move1(M, Aux, To, From).

%Monkey-banana
act(state(middle, onfloor, middle, hasnot), grasp, state(middle, onbox, middle, has)).
act(state(P1, onfloor, P1, H), climbs, state(P1, onbox, P1, H)).
act(state(P1, onfloor, P1, H), pushes(P1, P2), state(P2, onfloor, P2, H)).
act(state(P1, onfloor, P, H), walk(P1, P2), state(P2, onfloor, P, H)).
canget(state(_,_,_,has)).
canget(State1):-
    act(State1, _Action, State2),
    canget(State2).
go:-
    canget(state(atdoor, onfloor, atwindow, hasnot)).

%GCD-LCM
gcd(A, 0, A):- A>0.
gcd(A, B, R):-
    B>0,
    Rem is A mod B,
    gcd(B, Rem, R).
lcm(A, B, LCM):-
    gcd(A, B, GCD),
    Product is A*B,
    LCM is Product // GCD.

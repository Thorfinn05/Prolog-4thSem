mem_chk(X, [X|_]).
mem_chk(X, [_|T]):-
    mem_chk(X, T).

len_list([],0).
len_list([_|T], L):-
    len_list(T, L1), L is L1+1.

concate1([], L, L).
concate1([H|T], L2, [H|R]):-
    concate1(T, L2, R).

delete1(X, [X|T], T).
delete1(X, [H|T], [H|R]):-
    delete1(X, T, R).

insert1(X, L, [X|L]).
insert1(X, [H|T], [H|R]):-
    insert1(X, T, R).

sorted1([]).
sorted1([_]).
sorted1([X,Y|T]):-
    X=<Y,
    sorted1([Y|T]).

sum1([], 0).
sum1([H|T], S):-
    sum1(T, S1), S is S1+H.

even_odd([]).
even_odd([_,_|T]):-
    even_odd([T]).

rev([], []).
rev([H|T], R):-
    rev(T, RevT), concat(RevT, [H], R).

left_shift([H|T], R):-
    concat(T, [H], R).

last1([X], X).
last1([_|T], X):-
    last1(T, X).

init([_], []).
init([H|T], [H|R]):-
    init(T, R).

right_shift(L, R):-
    last1(L, Last),
    init(L, Init),
    R = [Last | Init].

%WaterJug
waterjug(X, Y):- X>4, Y<3, write('4L jug is overflowed'),nl.
waterjug(X, Y):- X<4, Y>3, write('3L jug is ovverflowed'), nl.
waterjug(X, Y):- X>4, Y>3, write('Both jugs are overflowed'),nl.
waterjug(X, Y):-
   (X=:=0, Y=:=0, nl, write('4L=0 & 3L=3 (Action: Pour water in 3L jug)'), YY is 3, waterjug(X, YY));
    (X=:=0, Y=:=3, nl, write('4L=3 & 3L=0 (Action: pour water from 3L jug to 4L jug)'), XX is 3, YY is 0, waterjug(XX, YY));
    (X=:=3, Y=:=0, nl, write('4L=3 & 3L=3 (Action: Pour water in 3L jug)'), YY is 3, waterjug(X, YY));
    (X=:=3, Y=:=3, nl, write('4L=4 & 3L=2 (Action: Pour water from 3L jug to 4L jug untill 4L jug is filled)'), XX is X+1, YY is Y-1, waterjug(XX, YY));
    (X=:=4, Y=:=2, nl, write('4L=0 & 3L=2 (Action: Empty 4L jug)'), XX is 0, waterjug(XX, Y));
    (X=:=0, Y=:=2, nl, write('4L=2 & 3L=0 (Action: Pour water from 3L jug to 4l jug)'), XX is Y, YY is X, waterjug(XX, YY));
    (X=:=2, Y=:=0, nl, write('4L=2 & 3l=0 (Action: Goal state is reached.)'));
    (X=:=0, Y=:=0, nl, write('4L=4 & 3L=0 (Action: Pour water in 4L jug)'), XX is 4, waterjug(XX, Y));
    (X=:=4, Y=:=0, nl, write('4L=1 & 3L=3 (Action: pour water in 3L jug from 4L jug untill 3L jug is filled)'), XX is X-3, YY is Y+3, waterjug(XX, YY));
    (X=:=1, Y=:=3, nl, write('4L=1 & 3L=0, (Action: Empty 3L jug)'), YY is 0, waterjug(X, YY));
    (X=:=1, Y=:=0, nl, write('4L=0 & 3L=1, (Action: Pour water from 4L jug to 3L jug)'), XX is Y, YY is X, waterjug(XX, YY));
    (X=:=0, Y=:=1, nl, write('4L=4 & 3L=1 (Action: Fill 4L jug)'), XX is 4, waterjug(XX, Y));
    (X=:=4, Y=:=1, nl, write('4L=2 & 3L=3 (Action: Pour watr from 4L jug to 3L jug untill it is filled)'), XX is X-2, YY is Y+2, waterjug(XX, YY));
    (X=:=2, Y=:=3, nl, write('4L=2 & 2L=0 (Action: Empty 3L jug)'), YY is 0, waterjug(X, YY)).

%GCD-LCM
gcd(X,0,X):-!.
gcd(X, Y, R):-
    Y>0,
    Rem is X mod Y,
    gcd(Y, Rem, R).

lcm(X, Y, R):-
    gcd(X, Y, G),
    R is (X*Y)//G.

%Missionary-Cannibal
start([3,3,left,0,0]).
goal([0,0,right,3,3]).
legal(CL, ML, CR, MR):-
    ML>=0, CL>=0, MR>=0, CR>=0,
    (ML>=CL; ML=0),
    (MR>=CR; MR=0).
move([CL, ML, left, CR, MR],[CL, ML2, right, CR, MR2]):-
    MR2 is MR+2,
    ML2 is ML-2,
    legal(CL, ML2, CR, MR2).
move([CL,ML, left, CR, MR],[CL, ML2, right, CR, MR2]):-
    MR2 is MR+1,
    ML2 is ML-1,
    legal(CL, ML2, CR, MR2).
move([CL, ML, left, CR, MR],[CL2, ML2, right, CR2, MR2]):-
    CR2 is CR+1,
    CL2 is CL-1,
    MR2 is MR+1,
    ML2 is ML-1,
    legal(CL2, ML2, CR2, MR2).
move([CL,ML,left,CR,MR],[CL2,ML,right,CR2,MR]):-
    CR2 is CR+2,
    CL2 is CL-2,
    legal(CL2, ML, CR2, MR).
move([CL,ML,left,CR,MR],[CL2,ML,right,CR2,MR]):-
    CR2 is CR+1,
    CL2 is CL-1,
    legal(CL2, ML, CR2, MR).
move([CL,ML,right,CR,MR],[CL,ML2,left,CR,MR2]):-
	% Two missionaries cross right to left.
	MR2 is MR-2,
	ML2 is ML+2,
	legal(CL,ML2,CR,MR2).
move([CL,ML,right,CR,MR],[CL2,ML,left,CR2,MR]):-
	% Two cannibals cross right to left.
	CR2 is CR-2,
	CL2 is CL+2,
	legal(CL2,ML,CR2,MR).
move([CL,ML,right,CR,MR],[CL2,ML2,left,CR2,MR2]):-
	%  One missionary and one cannibal cross right to left.
	CR2 is CR-1,
	CL2 is CL+1,
        MR2 is MR-1,
	ML2 is ML+1,
	legal(CL2,ML2,CR2,MR2).
move([CL,ML,right,CR,MR],[CL,ML2,left,CR,MR2]):-
	% One missionary crosses right to left.
	MR2 is MR-1,
	ML2 is ML+1,
	legal(CL,ML2,CR,MR2).
move([CL,ML,right,CR,MR],[CL2,ML,left,CR2,MR]):-
	% One cannibal crosses right to left.
	CR2 is CR-1,
	CL2 is CL+1,
	legal(CL2,ML,CR2,MR).
path(State,State,_,MovesList):-
    output(MovesList).
path(Current, Goal, Explored, MovesList):-
    move(Current, Next),
    \+ member(Next,Explored),
    path(Next, Goal, [Next|Explored], [[[Next, Current]|MovesList]]).
output([]).
output([[[A,B]|T]]):-
    output(T),
    write(B), write(' -> '), write(A),nl.
find:-
    start(Start),
    goal(Goal),
    path(Start,Goal,[Start],[]).

%Tower of Hanoi
move(1, Source, Destination, _):-
    write('Move disk from '), write(Source), write(' to '), write(Destination),nl.

move(N,Source, Destination,Aux):-
    N>1,
    M is N-1,
    move(M, Source, Aux, Destination),
    move(1,Source,Destination,_),
    move(M,Aux, Destination, Source).

%DFS
graph(a,b).
graph(a,c).
graph(b,d).
graph(b,e).
graph(c,f).
graph(c,g).
goal(f).
goal(g).
member1(X,[X|_]).
member1(X,[_|T]):- member1(X, T).
solve(Node,Sol):-
    dfs([],Node,Sol).  %Solving the predicate
dfs(Path,Node,[Node|Path]):-
    goal(Node).  %Goal state is reached
dfs(Path,Node,Sol):-
    graph(Node,Node1),  %Checking a graph of Node and Node1
    not(member1(Node,Path)),  %No recycling so checking if Node exists in Path or not
    dfs([Node|Path],Node1,Sol).  %Recursively doing for Node1 and so on

list_insert(X, L, [X|L]).
list_insert(X, [H|T], [H|R]):-
    list_insert(X, T, R).

%insert(2,[3,4,5],R).
%
%insert(2, [3,4,5], [2|[3,4,5]]). ----->(i)
%--> R = [2,3,4,5]
%
%insert(2, [3|4,5], [3|R1]):- insert(2, [4,5], R1).  //doing like (i)
%--> R = [3|R1] = [3,2,4,5]
%
%	insert(2, [4|5], [4|R2]);- insert(2, 5, R2).  //doing like (i)
%	--> R1 = [4|R2] = [4,2,5]
%	--> R = [3|R1] = [3,4,2,5]
%
%               insert(2, [5|[]], [5|R3]):- insert(2, [], R3). //doing
%               like (i)
%		--> R2 = [5|R3] = [5,2]
%		-->R1 = [4|R2] = [4,5,2]
%		--> R = [3|R1] = [3,4,5,2]

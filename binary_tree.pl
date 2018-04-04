istree(nil) :- !.
istree(t(_, L, R)) :- 
    istree(L), 
    istree(R).

btree([], T, T). 
btree([N|Ns], T0, T) :-
    addnumber(N, T0, T1), 
    btree(Ns, T1, T). 

addnumber(N, nil, t(N, nil, nil)) :- !. 
addnumber(N, t(Root, L, R), t(Root, L1, R)) :-
    N @< Root, 
    addnumber(N, L, L1). 
addnumber(N, t(Root, L, R), t(Root, L, R1)) :-
    N @> Root, 
    addnumber(N, R, R1). 

test(List) :-
    btree(List, _, Tree), 
	istree(Tree).

test2(Tree) :-
    istree(Tree).

/** <examples> 
?- btree([5, 6, 3, 1], _, What)
?- test([5, 6, 3, 1])
?- test2(t(a,t(b,nil,nil),nil))
 
*/

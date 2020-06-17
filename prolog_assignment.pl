% Q1. Program to find the maximum in the list.
max_no([A],A).
max_no([A|B],A):- max_no(B,C), A >= C.
max_no([A|B],D):- max_no(B,D), D > A.

% Q2. Return true if intersection of 2 lists is an empty list
% writing program for intersection
intersection1([],_).
intersection1([SS|X], Y) :- not(mem1(SS, Y)), intersection1(X, Y).


% Q3. Program to get the union of 2 lists
%defining member function
mem1(E, [E| _ ]).
mem1(E, [ _ |L]) :- mem1(E, L).

%union of 2 empty lists will be empty
union_list([],F,F).
union_list([S|Q],X,Z) :- mem1(S,X),!,union_list(Q,X,Z).
union_list([S|Q],X,[S|Z]):- union_list(Q,X,Z). 

% Q4. Program to find the final element of the lists
last_element(V,[V]).
last_element(V,[_|Z]):- last_element(V,Z).

% Q5. Program to get a tuple of 2 lists 

% IMPORTANT: Use function c_product1 to get the desired output

c_product([J], K) :-
   c_product1([[]], J, K).
c_product([J | T], K) :-
   c_product(T, R),
   c_product1(R, J, K).

c_product1([], _, []).
c_product1([J | IT], T, K) :-
   dis(J, T, F),
   c_product1(IT, T, R),
   append_list(F, R, K).

dis(_, [], []).
dis(X, [J | T], [K | R]) :-
   append_list(J, X, K),
   dis(X, T, R).


append_list(X, J, [X|J]).

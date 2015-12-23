preference(john, whiskey, like_little).
preference(john, gin, like_little).
preference(john, lager, like_much).
preference(mary, whiskey, like_verymuch).
preference(mary, redwine, like_much).
preference(peter, whiskey, like_much).
preference(peter, stout, like_much).
preference(peter, whitewine, like_no).
preference(paul, whiskey, like_no).
preference(paul, coffee, like_verymuch).
preference(ann, gin, like_verymuch).
preference(ann, lager, like_little).

0.1::buy(Person, Drink) :-
	preference(Person, Drink, like_little).

0.5::buy(Person, Drink) :-
	preference(Person, Drink, like_much).

0.9::buy(Person, Drink) :-
	preference(Person, Drink, like_verymuch).

0.1::buy2(Person, Drink) :-
	preference_soft(Person, Drink, like_little).

0.5::buy2(Person, Drink) :-
	preference_soft(Person, Drink, like_much).

0.9::buy2(Person, Drink) :-
	preference_soft(Person, Drink, like_verymuch).

0.4::preference_soft(Person, Drink, like_no);0.5::preference_soft(Person, Drink, like_little);0.1::preference_soft(Person, Drink, like_much) :-
	preference(Person, Drink, like_no).

0.5::preference_soft(Person, Drink, like_no);0.4::preference_soft(Person, Drink, like_much);0.1::preference_soft(Person, Drink, like_verymuch) :-
	preference(Person, Drink, like_little).

0.1::preference_soft(Person, Drink, like_much);0.1::preference_soft(Person, Drink, like_no);0.4::preference_soft(Person, Drink, like_little);0.4::preference_soft(Person, Drink, like_verymuch) :-
	preference(Person, Drink, like_much).

0.5::preference_soft(Person, Drink, like_verymuch);0.1::preference_soft(Person, Drink, like_little);0.4::preference_soft(Person, Drink, like_much) :-
	preference(Person, Drink, like_verymuch).

P::preference_with_distance(Person, Drink2, X):-
	preference(Person, Drink1, X),
	Drink1 \= Drink2,
	distance(Drink1,Drink2,L),
	P is 1.0/L.

get_pref([],_,Res,Res).
get_pref([H|T],Drink,Res,Acc):-
	H \= Drink,
	distance(H,Drink,L),
	Acc1 is Acc+L,
	get_pref(T,Drink,Res,Acc1).

%% tree(Name, Parent, Children).
tree(drink,none, [alcoholic, nonalcoholic]).
tree(nonalcoholic, drink, [coffee, soda]).
tree(coffee, nonalcoholic, []).
tree(soda, nonalcoholic, []).
tree(alcoholic,drink, [beer, wine, spirit]).
tree(beer, alcoholic, [ale, stout, lager]).
tree(ale, beer, []).
tree(stout, beer, []).
tree(lager, beer, []).
tree(wine, alcoholic, [whitewine, redwine]).
tree(redwine, wine, []).
tree(whitewine, wine, []).
tree(spirit, alcoholic, [gin, whiskey]).
tree(gin, spirit, []).
tree(whiskey, spirit, []).



distance(Name1, Name2, Distance) :-
	tree(Name1, P1, _),
	tree(Name2, P2, _),
	parents(Name1,Parents1, []),
	parents(Name2,Parents2, []),
	commonParent(Parents1,Parents2, Common, none),
	position(Common,Parents1,D1),
	length(Parents1,LL1),
	DL1 is LL1 - D1,
	position(Common,Parents2,D2),
	length(Parents1,LL2),
	DL2 is LL2 - D2,
	Distance is DL1 + DL2.


commonParent([],[],Res,Res).
commonParent([H1|T1], [H1|T2], Res, _):-
	commonParent(T1,T2,Res,H1).
commonParent([H1|T1], [H2|T2], Res, Acc):-
	H1 \= H2,
	Res = Acc.

parents(none, Res, Res).

parents(Name, Res, Acc):-
	tree(Name, Parent, _),
	Acc1 = [Parent|Acc],
	parents(Parent,Res,Acc1).


position(Element,[Element|_], 0).
position(Element, [_|Tail], Index):-
  position(Element, Tail, Index1),
  Index is Index1+1.


%Fluents
%----------------
available(egg).
eggsinbowl(n).

%Actions
%----------------
putInBowl(egg).
discard(egg).
smell(egg).

% Smelling an egg is always possible
poss(smell(_),true).
% Only put in bowl if the egg is good
poss(putInBowl(E),good(E)).
% Only discard an egg if it is not good
poss(discard(E),\+(good(E))).

%Succesor state axioms
%----------------------
eggsinbowl(N,do(A,S)) :- (A = putinBowl(_), eggsinbowl(N1,S), N1 is N+1) ; (A \= putInBowl(_), eggsinbowl(N,S)).

available(E,do(A,S)) :- (A\=putInBowl(E), A\=discard(E),available(E,S)).

Knows(good(Egg),do(A,S)) :- A=smell(Egg), good(Egg) ; Knows(good(Egg)). 


%Program
%----------------

% While not enough eggs are in the bowl, use an available egg. Once enough eggs are in the bowl, mix it and bake it.
proc (makeAnOmelette,
	while (?(whilecheck),
		Pi (n, available(n)) : useEgg(n))
	: mix
    : bake).

whilecheck :-
	eggsinbowl(x),
	x < 3.
	
% If you don't know whether an egg is good, smell it and then use it. If you know it is good, put in the bowl or else discard it.
proc(useEgg(egg), 
	if (\+KWhether(good(egg)), 
		smell(egg) : useEgg(egg), 
		if(Knows(good(egg)), 
			putInBowl(egg), 
			discard(egg))).

proc(mix,true).
proc(bake,true).
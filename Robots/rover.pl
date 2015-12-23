% Primitive control actions

primitive_action(hmove(_,_)).
primitive_action(vmove(_,_)).
primitive_action(collect_mineral((_,_))).

%Definitions of Complex Control Actions


% Preconditions for Primitive Actions

poss(hmove(Visited,1),S) :- currentPosition(X,Y,S), X<3, X1 is X+1, \+hole((X1,Y)), \+member(((X,Y),(X1,Y)),Visited).
poss(hmove(Visited,-1),S) :- currentPosition(X,Y,S), X>0, X1 is X-1, \+hole((X1,Y)), \+member(((X,Y),(X1,Y)),Visited).
poss(vmove(Visited,1),S) :- currentPosition(X,Y,S), Y1 is Y+1, \+hole((X,Y1)), Y<3, \+member(((X,Y),(X,Y1)),Visited).
poss(vmove(Visited,-1),S) :- currentPosition(X,Y,S), Y1 is Y-1, \+hole((X,Y1)), Y>0, \+member(((X,Y),(X,Y1)),Visited).

poss(collect_mineral((X,Y)),S) :- currentPosition(X,Y,S), mineral((X,Y),S).


% Successor State Axioms for Primitive Fluents.

currentPosition(X1,Y,do(A,S)) :- (A = hmove(_,1), currentPosition(X,Y,S), X1 is X+1) ; (A \= hmove(_,_), A \= vmove(_,_), currentPosition(X1,Y,S)).
currentPosition(X1,Y,do(A,S)) :- (A = hmove(_,-1), currentPosition(X,Y,S), X1 is X-1) ; (A \= hmove(_,_), A \= vmove(_,_),currentPosition(X1,Y,S)).
currentPosition(X,Y1,do(A,S)) :- (A = vmove(_,1), currentPosition(X,Y,S), Y1 is Y+1) ; (A \= vmove(_,_), A \= hmove(_,_),currentPosition(X,Y1,S)).
currentPosition(X,Y1,do(A,S)) :- (A = vmove(_,-1), currentPosition(X,Y,S), Y1 is Y-1) ; (A \= vmove(_,_), A \= hmove(_,_),currentPosition(X,Y1,S)).



% Initial Situation. Call buttons: 3 and 5. The elevator is at floor 4.

currentPosition(0,0,s0).

mineral(Pos,do(A,S)) :- mineral(Pos,S), A \= collect_mineral(Pos).
mineral((3,0),s0).
mineral((3,2),s0).
%mineral((0,0),s0).
hole((1,0)).
destination(3,3).

proc(movetest, hmove([],1) : hmove([],1) : hmove([],1) : hmove([],1)).

proc(moremovestest, moveto((0,2)) : moveto((3,2))).

proc(testfindone, collect_mineral((0,0))).

%proc(moveto((X,Y)), moveToX(X) : moveToY(Y)).
proc(moveto((X,Y)), ?(print("Moving to ")) : moveto((X,Y),[])).
proc(moveto((X,Y),Visited), (?(currentPosition(Xc,Yc)) : if(check((X,Y),(Xc,Yc)), reached, (
	(hmove(Visited,1) : ?(print("R")) : ?(X1 is Xc+1) :  ?(Nvisited = [((Xc,Yc),(X1,Yc))|Visited]) : moveto((X,Y),Nvisited))
  # (hmove(Visited,-1): ?(print("L")) : ?(X1 is Xc-1) :  ?(Nvisited = [((Xc,Yc),(X1,Yc))|Visited]) : moveto((X,Y),Nvisited))
  # (vmove(Visited,1): ?(print("U")) : ?(Y1 is Yc+1) :  ?(Nvisited = [((Xc,Yc),(Xc,Y1))|Visited]) : moveto((X,Y),Nvisited))
  # (vmove(Visited,-1): ?(print("D")) : ?(Y1 is Yc-1) :  ?(Nvisited = [((Xc,Yc),(Xc,Y1))|Visited]) : moveto((X,Y),Nvisited))
  	)))).

proc(reached, ?(currentPosition(X,Y)) : ?(print("Reached ")) : ?(print(X)) : ?(print(" ")) : ?(print(Y))).

%proc(moveToX(X), ?(currentPosition(X1,_)) : ?(checkloop(X, X1, Diff)) : if(Diff == 0, ?(true), (if(Diff > 0, moveRight(X) , moveLeft(X))))).
%proc(moveToY(Y), ?(currentPosition(_,Y1)) : ?(checkloop(Y, Y1, Diff)) : if(Diff == 0, ?(true), (if(Diff > 0, moveUp(Y) , moveDown(Y))))).

%proc(collect_minerals, while(some(n,mineral(n)), ?(print("collecting a mineral")) : collect_one_mineral) : movetodestination).
proc(collect_minerals, ?(print("start")) : while(some(n,mineral(n)), ?(print("collecting a mineral")) : collect_one_mineral): movetodestination).
proc(collect_one_mineral, pi(n, ?(mineral(n)) : moveto(n) : collect_mineral(n) : ?(print("collected")))).
%% proc(collect_one_mineral, pi(n, ?(mineral(n)) : collect_mineral(n) : ?(print("collected")))).
proc(movetodestination, ?(destination(X,Y)) : moveto((X,Y)) : ?(print("finished"))).

%checkloop(X, X1, Diff) :- Diff is X-X1.
%% proc(moveToY(Y), ?(currentPosition(_,Y1)) : ?(Diff is Y-Y1) : while((Diff =\= 0), if(Diff>0, vmove(Visited,1),vmove(Visited,-1)) )).

check((X,Y),(Xc,Yc)):- X=:=Xc, Y=:=Yc.

restoreSitArg(currentPosition(X,Y),S,currentPosition(X,Y,S)).
restoreSitArg(mineral((X,Y)),S,mineral((X,Y),S)).
restoreSitArg(next_mineral(N),S,next_mineral(N,S)).

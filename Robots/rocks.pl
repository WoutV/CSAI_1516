%% The goal is to store a rock from which both sand and ice has been removed.

:-include(kplanner).

prim_action(break_sand,[ok]).		% Remove a layer of sand from the rock
prim_action(break_ice,[ok]).		% Remove a layer of ice from the rock
prim_action(check_sand,[no,yes]).	% Check if the rock still contains sand
prim_action(check_ice,[no,yes]).	% Check if the rock still contains ice
prim_action(store,[ok]).			% Put away the rock

prim_fluent(rock).              	% stored or out
prim_fluent(sand).					% yes or no
prim_fluent(ice).	       		 	% yes or no
prim_fluent(max_sand).				% unknown bound no the number of sand layers
prim_fluent(max_ice).     	  		% unknown bound on the number of ice layers

poss(break_sand,and(rock=out,sand=yes)).			% Removing a layer of sand is only possible when the rock is not stored and contains sand.
poss(break_ice,and(sand=no,and(rock=out,ice=yes))). % Removing a layer of ice is only possible when the rock is not stored and contains ice but no sand.
poss(check_sand,true).
poss(check_ice,true).
poss(store,and(and(sand=no,ice=no),rock=out)).		% Storing a rock is only possible if no more ice and sand are on the rock.

causes(store,_,rock,stored,true).					% Storing a rock causes the rock value to be 'stored'
causes(break_sand,max_sand,X,X is max_sand-1).		% Removing a layer of sand
causes(break_ice,max_ice,X,X is max_ice-1).			% Removing a layer of ice

causes(break_sand,sand,no,true).					% Removing last layer of sand
causes(break_ice,ice,no,true).						% Removing last layer of ice

causes(break_sand,sand,yes,true).					% Removing a layer of sand which is not the last one
causes(break_ice,ice,yes,true).						% Removing a layer of ice which is not the last one

settles(check_sand,X,sand,X,true).	% checking determines whether there is still sand
settles(check_ice,X,ice,X,true). 	% checking determines whether there is still ice

settles(check_sand,no,max_sand,0,true).  % if there is no more sand, max_sand is 0
settles(check_ice,no,max_ice,0,true).	 % if there is no more ice, max_ice is 0
rejects(check_sand,yes,max_sand,0,true). % if the sand is seen to be yes, max_sand cannot be 0
rejects(check_ice,yes,max_ice,0,true). 	 % if the ice is seen to be yes, max_ice cannot be 0

init(rock,out).      % the rock is out and available
init(sand,yes).		 % sand may be on the rock initially
init(ice,yes).       % ice may be on the rock initially
init(sand,no).    	 % there may be no sand on the rock initially
init(ice,no).		 % there may be no ice on the rock initially

parm_fluent(max_sand).           % max_sand is a unique parameter representing the amount of sand layers left
parm_fluent(max_ice).            % max_ice is a unique parameter representing the amount of ice layers left
init_parm(generate,max_sand,1).  % small bound for generating is 1
init_parm(generate,max_ice,1).   % small bound for generating is 1
init_parm(test,max_sand,100).    % large bound for testing is 100
init_parm(test,max_ice,100).     % large bound for testing is 100

top :- kplan(rock=stored).		 % At the end of the program, the rock needs to be stored (which means sand and ice has been removed)

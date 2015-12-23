:-include(kplanner).


prim_action(moveToTable,[ok]). % Action that should move the block to the table
prim_action(senseBlocksLeft,[yes,no]). % Sense if there are still blocks left that are not on the table
prim_action(senseBlock,[unclear,floor,table]). % Sense whether a block is unclear (on table but unclear), on the floor or on the table.
prim_action(nextBlock,[ok]). % Move to next block
prim_action(skipBlock,[ok]). % Skip this block cause it is unclear and move to next block.

prim_fluent(blocks_left). % Number of blocks that are not on the table
prim_fluent(block). % State of the current block


poss(moveToTable, and(neg(blocks_left=0),block=floor)). % Moving to table is only possible if there is a block left and it is on the floor.
poss(senseBlocksLeft,true).
poss(senseBlock,true).
poss(nextBlock, and(neg(blocks_left=0),block=table)). % Moving to the next block is only possible if the current block is on the table and there are still blocks left.
poss(skipBlock, and(neg(blocks_left=0),block=unclear)). % Skipping a block is only possible if the block is unclear and there are blocks left.


causes(moveToTable,blocks_left,X,X is blocks_left-1).
causes(nextBlock,blocks_left,X,X is blocks_left-1).
causes(skipBlock,blocks_left,X,X is blocks_left-1).


settles(senseBlock,X,block,X,true). % Sense the position of the block

% Sense if there are still blocks left.
settles(senseBlocksLeft,no,blocks_left,0,true).
rejects(senseBlocksLeft,yes,blocks_left,0,true).

init(block,floor).
init(block,table).
init(block,unclear).

parm_fluent(blocks_left).           % blocks left is a unique parameter
init_parm(generate,blocks_left,1).  % small bound for generating is 1
init_parm(test,blocks_left,100).    % large bound for testing is 100

top :- kplan(blocks_left=0). % If no blocks are left, this means they are all on the table.
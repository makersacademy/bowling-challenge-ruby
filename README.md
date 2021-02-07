Bowling Challenge in Ruby
=================

My implementation in Ruby of the KataBowling challenge, based on a game of standard 10-pin American bowling. It successfully scores a game of bowling if a valid turn sequence is passed in.


## Bowling Rules:


* 10 turns allowed per game.	* 10 turns allowed per game.
* 2 rolls allowed per turn.	* 2 rolls allowed per turn.
* If bowler fails to knock both down, score for that turn is sum of its rolls rolls.	* If bowler fails to knock both down, score for that turn is sum of its rolls rolls.
* Spare: bowler knocks down 10 on roll #2. Score is 10 + next roll score.	* Spare: bowler knocks down 10 on roll #2. Score is 10 + next roll score.
* Strike: bowler knocks down 10 on roll #1. Score is 10 + next 2 throw scores.	* Strike: bowler knocks down 10 on roll #1. Score is 10 + next 2 throw scores.
* Spare or strike on last turn (turn 10), gets 1 or 2 bonus rolls respectively. These bonus rolls count toward the 10th turn.	* Spare or strike on last turn (turn 10), gets 1 or 2 bonus rolls respectively. These bonus rolls count toward the 10th turn.

## My Approach:	## My Approach:

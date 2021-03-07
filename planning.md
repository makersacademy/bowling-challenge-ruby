| Input         | Output          |
| ------------- | --------------- |
| integer < 9   | Score for frame |
| '/'           |                 |
| 'X'           |                 |
| 10 frames     |                 |
| 2 rolls/frame |                 |


- Frame 1-9 are the same? Definitely 2-8.
- Frames 1-9: Max number of pins per frame = 10
- Frame 10 may need extra roll.
- Rolls need to be passed in by player -- but as just integers, or strings too?
- Score needs to be stored and can be altered when the scores for the next frame are passed in.
- Frame needs to go up every two rolls unless the first roll is a strike.
- Accumulator for score and for frame.
- Input for a roll is one (10) or two arguments.

#### How to store points...
1. Separate hashes with arrays for rolls and total score.
  - but how do I amend the final score.
2. Array of hashes
3. Array where no separation between frames
4. Array of arrays

Score = [{'Frame 1' => [roll1, roll2, score]} ]

score = [[1, 3, 4], [], [], [], [], [], [], [], [], []]
bonus = [0, 1, 2, 3, ]

** probably easier to work with an array to add scores **
** How can I tell which frame I am on? **

Or instead of rolls, have strike => false, spare => true

#### Order of game...

Takes input of rolls with variable args. (...test with double/mocking...?) (roll1, roll2 = nil)
Each time a roll/pair of rolls is added, +1 frame.
Loop until frame = 10...

###### frame = 1 or 10
add points to current frame.

###### frame = 2-8
If the previous frame's (use indexes on arrays) first index = 10 add both numbers from roll to previous total.
If the previous frame's first two indexes = 10, add the first roll number to previous total.
Add points to current frame.

## User stories

As a player,
So I can play a game of bowling,
I want to input my shots into the scorecard.  

As a player,
So I can play a game of bowling,
I want to add my pins from this frame to the score of the current frame.

As a player,
So I can play a game of bowling,
I want to keep a running total of the score in each frame.

As a player,
So I can knock down all ten pins each frame,
I want to enter ONE roll (strike only) or TWO rolls onto the scorecard.

As a player,
So I can count my bonus points,
I want to add points from the current frame to the total of a previous frame if I scored a strike or a spare in the previous frame.

As a player,
So I can play a final round,
If I score a spare or strike in frame 10, I want three total rolls and all points adding to the total.

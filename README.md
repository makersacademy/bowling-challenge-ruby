Bowling Challenge in Ruby
=================

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
Edge cases e/g/ can't input 12 etc. How will user inptu

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
* Iain's complete or not complete bonus
* number of bonus balls, when it gets to zero, closed

#### Order of game...

Takes input of rolls with variable args. (...test with double/mocking...?) (roll1, roll2 = nil)
Each time a roll/pair of rolls is added, +1 frame.
Loop until frame = 10...

###### frame = 1 or 10
add points to current frame.

###### frame = 2-8
If the previous frame's (use indexes on arrays) first index = 10, add both numbers from rolls to previous total.
If the previous frame's first two indexes = 10, add the first roll number to previous total.
Add points to current frame.

###### frame 10
add points to current frame.

## User stories

As a player,
So I can play a game of bowling,
I want to keep a running total of the score in each frame.

As a player,
So I can play a game of bowling,
I want to input my shots into the scorecard.  

As a player,
So I can knock down all ten pins each frame,
I want to enter ONE roll (strike only) or TWO rolls onto the scorecard.

As a player,
So I can play a game of bowling,
I want to add my pins from this frame to the score of the current frame.

As a player,
So I can count my bonus points,
I want to add points from the current frame to the total of a previous frame if I scored a strike or a spare in the previous frame.

As a player,
So I can play a final round,
If I score a spare or strike in frame 10, I want three total rolls and all points adding to the total.

--


* Feel free to use google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday week

## The Task

**THIS IS NOT A BOWLING GAME, IT IS A BOWLING SCORECARD PROGRAM. DO NOT GENERATE RANDOM ROLLS. THE USER INPUTS THE ROLLS.**

Count and sum the scores of a bowling game for one player. For this challenge, you do _not_ need to build a web app with a UI, instead, just focus on the logic for bowling (you also don't need a database). Next end-of-unit challenge, you will have the chance to translate the logic to Javascript and build a user interface.

A bowling game consists of 10 frames in which the player tries to knock down the 10 pins. In every frame the player can roll one or two times. The actual number depends on strikes and spares. The score of a frame is the number of knocked down pins plus bonuses for strikes and spares. After every frame the 10 pins are reset.

As usual please start by

* Forking this repo

* Finally submit a pull request before Monday week at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday week at 9am.

___STRONG HINT, IGNORE AT YOUR PERIL:___ Bowling is a deceptively complex game. Careful thought and thorough diagramming — both before and throughout — will save you literal hours of your life.

## Focus for this challenge
The focus for this challenge is to write high-quality code.

In order to do this, you may pay particular attention to the following:
* Using diagramming to plan your approach to the challenge
* TDD your code
* Focus on testing behaviour rather than state
* Commit often, with good commit messages
* Single Responsibility Principle and encapsulation
* Clear and readable code

## Bowling — how does it work?

### Strikes

The player has a strike if he knocks down all 10 pins with the first roll in a frame. The frame ends immediately (since there are no pins left for a second roll). The bonus for that frame is the number of pins knocked down by the next two rolls. That would be the next frame, unless the player rolls another strike.

### Spares

The player has a spare if the knocks down all 10 pins with the two rolls of a frame. The bonus for that frame is the number of pins knocked down by the next roll (first roll of next frame).

### 10th frame

If the player rolls a strike or spare in the 10th frame they can roll the additional balls for the bonus. But they can never roll more than 3 balls in the 10th frame. The additional rolls only count for the bonus not for the regular frame count.

    10, 10, 10 in the 10th frame gives 30 points (10 points for the regular first strike and 20 points for the bonus).
    1, 9, 10 in the 10th frame gives 20 points (10 points for the regular spare and 10 points for the bonus).

### Gutter Game

A Gutter Game is when the player never hits a pin (20 zero scores).

### Perfect Game

A Perfect Game is when the player rolls 12 strikes (10 regular strikes and 2 strikes for the bonus in the 10th frame). The Perfect Game scores 300 points.

In the image below you can find some score examples.

More about ten pin bowling here: http://en.wikipedia.org/wiki/Ten-pin_bowling

![Ten Pin Score Example](images/example_ten_pin_scoring.png)

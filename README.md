Bowling Challenge in Ruby
=================

## The Task


A bowling game consists of 10 frames in which the player tries to knock down the 10 pins. In every frame the player can roll one or two times. The actual number depends on strikes and spares. The score of a frame is the number of knocked down pins plus bonuses for strikes and spares. After every frame the 10 pins are reset.

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


User Stories

 - Max 6 players can play
 - Minimum 2 players can play
 - 10 frames per player per game
 - player can do 2 rolls usually
 - if player scores 10 points with first roll then strike
 - if player scores 10 points with 2 rolls then spare
 - for score every card is a sum of the points for 2 rolls unless strike or spare
 - if strike then the score: score of the roll (10) + strike bonus score: of the next 2 rolls
 - if strike then player has only one roll
 - if spare then the score: score ot the rolls (10) + spare bonus score: of the next 1 roll
- 10th frame can have 3 rolls if strike or spare
- if 3 strikes in 10th frame - score is 30
- if spare in 10th frame - score is 20
- if 'perfect game' (12 strikes) - score is 300 points
- gutter game - when 0 pins throughout the whole game


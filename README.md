Bowling Challenge in Ruby
=================

## The Task

**THIS IS NOT A BOWLING GAME, IT IS A BOWLING SCORECARD PROGRAM. DO NOT GENERATE RANDOM ROLLS. THE USER INPUTS THE ROLLS.**

Count and sum the scores of a bowling game for one player. For this challenge, you do _not_ need to build a web app with a UI, instead, just focus on the logic for bowling (you also don't need a database). Next end-of-unit challenge, you will have the chance to translate the logic to Javascript and build a user interface.

A bowling game consists of 10 frames in which the player tries to knock down the 10 pins. In every frame the player can roll one or two times. The score of a frame is the number of knocked down pins plus bonuses for strikes and spares. After every frame the 10 pins are reset.

## Focus for this challenge
High-quality code.

In order to do this, you may pay particular attention to the following:
* Using diagramming to plan your approach to the challenge
* TDD your code
* Focus on testing behaviour rather than state
* Commit often, with good commit messages
* Single Responsibility Principle and encapsulation
* Clear and readable code

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

A Perfect Game is when the player rolls 12 strikes and scores 300 points.

![Ten Pin Score Example](images/example_ten_pin_scoring.png)

### Lizzy's plan

A game starts with 1 frame. All new frames have: current_roll (0), rolls_remaining (2), score.

Each turn the user enters their 'roll' (number of pins knocked down), the roll is added to the score of every frame with rolls_remaining > 0.

Frame's current_roll == 1
   && roll == 10, STRIKE rolls_remaining is unchanged, and a new frame is opened (if possible, up to 10 frames).
   otherwise, rolls_remaining is decremented. 
Frame's current_roll == 2
   && roll 1 + roll 2 == 10, SPLIT rolls_remaining is unchanged, otherwise decremented.
   In all cases, a new frame is opened (if possible, up to 10 frames).
Frame's current_roll == 3, rolls_remaining decrements to 0

Once a frame's rolls_remaining == 0, the score is calculated and added to the games frame scores.

pseudocode
.roll(pins) current_roll on 'open' frames goes up. score on 'open' frames goes up.
    check for strike 
    check for split
    (.add_frame if possible)
    check for 'closed' frames (add score to game's frame_scores)
    check for game over (sum frame_scores)


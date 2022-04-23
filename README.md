Bowling Challenge in Ruby
=================

**THIS IS NOT A BOWLING GAME, IT IS A BOWLING SCORECARD PROGRAM. THE USER INPUTS THE ROLLS.**

Run this app in the command line with `ruby score_calculation_interface.rb`. The app counts and sums the scores of a bowling game for one player. 

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

![Ten Pin Score Example](images/example_ten_pin_scoring.png)


## Focus for this challenge
The assigned focus for this challenge was to write high-quality code.

In order to do this, the advice was to pay particular attention to the following:

* Using diagramming to plan your approach to the challenge - This was completed on paper (prior to the swimming trip).

* TDD your code - The code was tested by running the app and interacting with it on the command line. Ruby maths logic was tested using `irb`. As the current implentation as a single, long route, I thought that using Rspec unit testing did not make sense in this case.

* Focus on testing behaviour rather than state - The behaviour tested was whether or not the app returned the expected score.

* Commit often, with good commit messages - This did not happen! I began this task shortly before an appointment to take my baby for a swim. The basic route through the game (without bonuses for strikes and spares), happened beforehand, but unfortunately I did not commit in my haste to leave for my appointment. Much of the logic happened on paper, on a note pad on the bus. When I returned home I typed it all up from my notes.

* Single Responsibility Principle and encapsulation - This did not happen, for reasons outlined above.

* Clear and readable code - Whilst not encapsulated in classes/ methods, I believe that the logic is easy to follow, especially given the presence of the notes provided for each stage.

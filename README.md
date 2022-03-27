first attempt dividing into frames but this added an extra layer of complication

start by testing gutter game as simplest application of it, drives creation of roll and score methods - passed it with hard-coded 0 in score

tested effect on score by rolling 1 and then 2 for every turn, which drove creation of class-level array for holding scores 

tempting to use array.sum method to total score but wanted to increment the turn with an eye on implementing spare and strike bonuses, which depend on ensuing games, so would be helpful to have a turn number to work with

so did a 20.times block adding the value stored in the @rolls array at the index position of turn (starting at 0 at top of method to avoid adjustment for zero-indexing) to the total, and incrementing the turn by 1 - then return total after block

then test for spare, inputting the first three rolls (the first two making a spare) and then 17 zeros for the remainder as our score method returns the total for the whole game and we just want to focus on three rolls - this fails as expected because there's no functionality for bonuses yet

this drives incrementing score-keeping by frames instead of just rolls (ie. by increments of 2) - so change the 20.times to 10.times, and turn incrementing by 2, to set up the conditionality for two rolls in a frame totalling 10 and thus getting the bonus of the score from the first roll of the next frame - so now the initialize method treats it as 20 separate rolls, but the score-keeping does it in increments of two - maybe not the ideal presentation but it makes the implementation easier

this has the limitation of not being a 'live' game - ie you can't check your score on the go, user has to manually input each score before checking the total

refactor this spare logic into a private method





A bowling game consists of 10 frames in which the player tries to knock down the 10 pins. In every frame the player can roll one or two times. The actual number depends on strikes and spares. The score of a frame is the number of knocked down pins plus bonuses for strikes and spares. After every frame the 10 pins are reset.

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

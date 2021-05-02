Approach
----------
* Created two classes: `Game` to manage the game in which further functionality would be added if an app was created and `Scorecard` which records the scores for a game through `add_score` and can calculate the total score by `calculate_score` as well as determine if the game has finished with `game_over?`
* The `Game` class was designed to interact with the controller whilst the `Scorecard` class contains the majority of the logic for the programme.
* The `add_score` method was the first feature added and this adds scores to the `@scorecard` variable with each frame represented by a nested array. The score is placed in the correct position based upon the `@frame` and `@roll` variables.
* The `@scorecard` variable initially is defined as an array of 12 sets of `[nil, nil]`, the first 10 representing the first 10 frames and the last two acting as placeholders for potential bonus balls as a result of the final frame.
* `add_score` also is aware of if the ball rolled is a strike and will move onto the next frame accordingly.
* `calculate_score` was the next feature added and this returns the total score for the round including bonuses. This loops through the first 10 scores in `@scorecard`, determines if the frame is a strike or spare and adds the bonus score accordingly. If the bonus rolls have not been added yet they are 0 until the scorecard is updated.
* As the last two elements in `@scorecard` are only used as bonus balls they do not need to be included in the loop and will be accounted for if they are required.
* `game_over?` was the final feature and this required a rework of the scorecard as the default values were initially set to 0 rather than `nil`. This meant that it was impossible to differentiate between a ball that has not been rolled yet and a gutterball which was an issue in deciding when the end of the game was when bonus balls were required. This issue was fixed using `nil` in place of 0 and with a combination of `nil.to_i`, `.compact` and `||` to prevent `nil` disrupting calculations.

Bowling Challenge in Ruby
=================

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

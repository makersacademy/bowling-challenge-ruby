Bowling Challenge in Ruby
=================

Installation instructions:
- clone the repo
- run bundler
- open IRB
- require './lib/game.rb'
- create a new game (e.g. game = Game.new)
- enter your rolls (e.g. game.roll(9))
- the programme changes frames automatically (e.g. if you score a strike in a frame, the next roll you input will automatically be added to the subsequent frame)

===================


Notes to coach/reviewer:

I was under the weather this weekend so wasn't able to finish the challenge. As things stand, a user can calculate the scores for bowling but the final frame is not accounted for.

I was struggling to understand what I should be defining in the Frame classand what I should be defining in the Game class, and so at some point between the sixth and seventh commit I looked at the work of another student on the pull history of the challenge (Nico Cortese, pull #252). This gave me the idea for a FinalFrame class, as well as leading me to define spares and strikes and completed frames as their own classes (prior to that, I had defined whether a frame was less than ten, which is along the same lines but less efficient as it doesn't distinguish between strikes and spares). I did, however, try not to look at this piece of work too much, and the basic logic of this exercise is my own and builds on what I had been working on up until this point (for which I apologise - I'm aware it's not the easiest to read).

Given time, I would like to:
- prevent a player from entering a score higher than 10 per roll.
- implement logic for the final frame, via a FinalFrame class.
- refactor further - aside from anything else, there are definitely some redundancies in the code and in the tests, but I don't fancy breaking it at 2am. 
- tighten up the testing

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

Bowling Challenge in Ruby
=================

## Update

This is a simple bowling scorecard program written in Ruby, and using RSpec for testing.

This was a tough challenge and I'm disappointed not to finish it completely - I'm nearly done, but the scoring class doesn't currently talk to the frame/game classes. The scoring class calculates the scores per frame, I just need to hook it up so the frames obtain a score, and the game class totals them all up (or maybe the scoring class can also provide the total, which would make more sense). 

This was diagrammed at the start (images to follow), and I wrote plenty of user stories, which I will also put up in the readme. I simply ran out of time, possibly through over-thinking and over-refactoring the earlier classes (the scoring class is a bit of a mess at the moment).

It is fully tested, with 100% coverage using RSpec.

## Installation instructions

```
git clone https://github.com/edpackard/bowling-challenge-ruby.git
gem install bundler
bundle
```

## How to use this program

Open `irb` from the command line and `require` the `game.rb` file. If you are in the `bowling-challenge-ruby` directory, `require './lib/game.rb'` will open the program.

* To start a new game type `game = Game.new`
* To enter a score type `game.roll(4)` (the number in the brackets must be a valid roll)
* To see the scorecard type `game.scorecard`
* The scorecard currently shows the rolls entered and updates automatically per roll
* You can only make valid rolls, and you cannot make further rolls when the game is complete
* Coming soon: frame score and total score on the scorecard

## The Task

**THIS IS NOT A BOWLING GAME, IT IS A BOWLING SCORECARD PROGRAM. DO NOT GENERATE RANDOM ROLLS. THE USER INPUTS THE ROLLS.**

Count and sum the scores of a bowling game for one player. For this challenge, you do _not_ need to build a web app with a UI, instead, just focus on the logic for bowling (you also don't need a database). Next end-of-unit challenge, you will have the chance to translate the logic to Javascript and build a user interface.

A bowling game consists of 10 frames in which the player tries to knock down the 10 pins. In every frame the player can roll one or two times. The actual number depends on strikes and spares. The score of a frame is the number of knocked down pins plus bonuses for strikes and spares. After every frame the 10 pins are reset.

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

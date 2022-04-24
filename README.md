Bowling Challenge in Ruby
=================

This is a program that calculates the final score of a bowling game. Initially, the score of a game with no strikes or spares was calculated to start simple. Then, functionality for spares were implemented along with having one strike in the game. Then the bonus round was taken into account when the player scores a strike or a spare in frame 10. Finally, the functionality for scoring two strikes in a row was implemented which then meant that correctly scoring a perfect game was covered with all these steps. In order to make the code more readable, once all the tests were passing, the score method was refactored using three private methods.

This program was written using the TDD (Test Driven Development) process using RSpec while also being Object Oriented by creating a Game class that would take the rolls of a game as input from the user when creating an instance of this class. This program also assumes that a valid set of rolls will be inputted from the user.

## Getting Started

Start by cloning this repository and installing bundler if you haven't already. Then install the necessary gems present in the [Gemfile](https://github.com/jmcnally17/bowling-challenge-ruby/blob/main/Gemfile)
```
git clone https://github.com/jmcnally17/bowling-challenge-ruby.git
gem install bundler
bundle
```
Now, you will be setup to start using the Game class in the [lib](https://github.com/jmcnally17/bowling-challenge-ruby/tree/main/lib) folder in order to calculate bowling scores.

## How To Use

Start in irb:
```
irb
require_relative './lib/game'
```
Then create an instance of a game with the rolls as an argument:
```
game = Game.new([[10],[10],[1,8],[1,4],[0,0],[0,3],[0,0],[0,4],[7,0],[0,10],[5]])
```
The only thing left for the user to do is to use the score method to find the final score for this particular game:
```
game.score
```

## Tests

Run `rspec` in the terminal in the [main](https://github.com/jmcnally17/bowling-challenge-ruby) directory in order to run the tests present in the [spec](https://github.com/jmcnally17/bowling-challenge-ruby/tree/main/spec) folder. These tests have provided a 100% test coverage from SimpleCov while this program also commits 0 offenses when running RuboCop with help from the [Makers rubocop scaffolint](https://github.com/jmcnally17/bowling-challenge-ruby/blob/main/.rubocop.yml).

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

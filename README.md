# Bowling Challenge in Ruby

This program calculates the score of a bowling game given the rolls. A user can input the rolls sequentially as they occur:

```ruby
game.bowl(5)
game.bowl(3)
# etc.
```

The method returns the current total score, following [traditional ten-pin bowling rules](https://en.wikipedia.org/wiki/Ten-pin_bowling#Traditional_scoring). There is no need to enter `game.bowl(0)` after a strike; the game logic will automatically move onto a new frame when a strike occurs (except for the final frame).

## Design

This program comprises two classes: Game and Frame. Game encompasses the rules and logic of ten-pin bowling, and calculates the total score. Game holds an array of Frame objects.

Frame objects keep track of their own pinfall and any bonuses that have been added to them by the game. They can calculate their frame score from the pinfall plus the bonuses. They can also calculate if they are a strike or a spare.

## Installation

```bash
git clone https://github.com/rdupplaw/bowling-challenge-ruby.git
cd bowling-challenge-ruby
```

## Usage

```ruby
# in IRB/Pry

require './game'
game = Game.new
game.bowl(10)
game.bowl(4)
# etc.
```

## Testing

```bash
rspec
```

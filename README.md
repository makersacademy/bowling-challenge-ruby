# Bowling Challenge in Ruby
[![Tests](https://github.com/ruiined/bowling-challenge-ruby/actions/workflows/main.yml/badge.svg)](https://github.com/ruiined/bowling-challenge-ruby/actions/workflows/main.yml)
## Overview
_Ruby challenge provided by [Makers](https://github.com/makersacademy/bowling-challenge-ruby)._
100% test coverage

## How to Install
  1. clone this git directory
  2. `cd bowling-challenge-ruby`
  3. `bundle`

## How to Run
  1. `irb -r './lib/game.rb'`
  2. `game = Game.new` to start a new game
  3. `game.roll(num_of_pins)` until you reach 'game over'
  4. `game.total_score` to count your final score, or anytime during the game

## How to Test
  1. `rspec`
  2. `rubocop`

## Diagram
![Bowling Scorecard Diagram](https://github.com/ruiined/bowling-challenge-ruby/blob/main/images/bowling_score_diagram.png)

```
                                       (O)           (O)
                                       ||     (O)    ||
  .----.                               ||     ||     ||
 /   O O\                             /  \    ||    /  \
 '    O  '                           :    :  /  \  :    :
 \      /                            |    | :    : |    |
__`----'______________________________\__/__|    |__\__/____    
                                             \__/
```




# Bowling Challenge - Ruby

Bowling Challenge is a collection of Ruby classes and unit tests developed to satisfy the end-of-unit requirements of a challenge set during week 5 of the Makers Academy bootcamp.

## Installation

Use the Ruby package manager [Bundler](https://bundler.io/) to setup your environment after cloning the repository.

```bash
git clone git@github.com:Mornevanzyl/bowling-challenge-ruby.git

gem install bundle

bundle
```

## Usage

```ruby
require './lib/game'

game = Game.new # returns instance of Game class

framee = Frame.new # returns instance of Frame class

frame.add_roll(3) # registers a roll of 3 pins
frame.add_roll(7) # completes frame, registers a spare
frame.add_roll(10) # registers a strike
```

## Approach
I followed a [TDD](https://bit.ly/3q65B8q) approach to satisfying the requirements of this challenge. A systematic and iterative cycle of interpreting a series of user stories and developing feature tests/unit tests/feature implmentation/refactoring.

A review of the user specification revealed that at this stage, the application is simply a [ten-pin bowling](https://en.wikipedia.org/wiki/Ten-pin_bowling) scoring app.

The ```Frame``` class handles most of the ```rolls``` and associated controls, wilst the ```Game``` class manages the frames and scoring.

## Suggested Improvements
This section outlines known/identified areas of improvement/optimisation that serve as input to future development of this project.

- Extend to multi-player functionality.

- Add a web front-end.

##  Acknowledgements/Appreciations
- I'd like to thank the academy...

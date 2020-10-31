# Bowling Challenge in Ruby

Bowling score card built for the Week 5 weekend challenge at Makers.

## Installation

```
$ git clone 
$ bundle install
```

## Use

```
$ irb -r './app.rb'
$ scorecard = Scorecard.new
$ scorecard.roll(6)
$ scorecard.roll(4)
$ scorecard.score
  => 10
etc...
```

## Tests

Run tests using rspec. A full game feature test is available in 'spec/features/scoreboard_spec.rb'
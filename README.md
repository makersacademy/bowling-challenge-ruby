Bowling Challenge in Ruby
==========================

[![Maintainability](https://api.codeclimate.com/v1/badges/6c830bd55e2312455aa1/maintainability)](https://codeclimate.com/github/AJ8GH/bowling-challenge-ruby/maintainability) [![Build Status](https://travis-ci.com/AJ8GH/bowling-challenge-ruby.svg?branch=main)](https://travis-ci.com/AJ8GH/bowling-challenge-ruby)

A Bowling game tracker written in Ruby.

## Technologies used
-

## Dependencies
-

## Getting started
-

--------

## Approch and design
-

## Reflections
-

---------

## User stories

```
As a bowler,
So that I can track my score while I play,
I want to be able to record a score from 1 roll.

As a bowler,
So that I can accurately assess my game,
I want to be able to record the score of individual roles,

As a bowler,
So that I can track my total score across multiple rolls and frames,
I want my score to accumlate as I play.

Specs:
- 10 frames
- spare bonuses
- strike bonuses
- final frame bonus rolls
```

## Models

### Class models

objects | Messages
--------|----------
Game    | game.roll
Frame   | game.score -> sum of 2 rolls or 1 roll if strike
Spare   | game.over
Strike  | game.final_frame?
        | game.bonus
        | frame.over?
        | frame.status -> :strike, :spare
        | frame.score -> sum of 2 rolls or 1 roll if strike

### sequence diagrams
```flow
alias p = "Player"
alias g = "Game"
alias f = "Frame"

p->g: "roll(score)"
g->f: "Frame.new"
f-->g: "frame1"
g->g: "frame1.score << score"
```

----

## Rules

### basic functionality
- 1 player
- 10 frames
- rolls per regular frame:
  - 1 if strike
  - 2 if *no* strike
- rolls per final frame:
  - 2 if *no* spare or strike
  - 3 if spare or strike
- score = number of pins *(+ strike / spare bonus)*

### bonuses
- ***strike bonus:***
  - number of pins knocked down in next 2 rolls
- ***spare bonus:***
  - number of pins knocked down in next roll
- ***final frame bonus***
  - spare or strike in final frame results in 3 rolls total for that frame
  - spare: 1 extra roll
  - strike: 2 extra rolls

### Special games
- ***perfect game:***
  - 12 strikes (10 + 2 bonus rolls)
  - 300 points
- ***gutter game:***
  - 20 zero rolls
  - 0 points

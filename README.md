Bowling Challenge in Ruby 🎳
==========================

[![Build Status](https://travis-ci.com/AJ8GH/bowling-challenge-ruby.svg?branch=main)](https://travis-ci.com/AJ8GH/bowling-challenge-ruby) [![Coverage Status](https://coveralls.io/repos/github/AJ8GH/bowling-challenge-ruby/badge.svg?branch=main)](https://coveralls.io/github/AJ8GH/bowling-challenge-ruby?branch=main) [![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop) [![Maintainability](https://api.codeclimate.com/v1/badges/6c830bd55e2312455aa1/maintainability)](https://codeclimate.com/github/AJ8GH/bowling-challenge-ruby/maintainability)

Bowling score tracker written in Ruby

## Specification

- Create a program to calculate bowling scores for a single game
- Program should implement the logic, but not a UI
- Methods and classes should be short and clean, with clear responsibilites

## Approch and design

Classes:

Game
  - The interface where rolls are input into the system
  - Manages frames and applies spare and strike bonuses.

Frame
  - Stores rolls, knows if it is a spare or strike, and when it is over.
  - Once it knows it is a final frame, it's logic adjusts to handle the various scenarios (whether the player gets 2 or 3 roles).

ScoreBoard
  - Calculates overall score of the game or running total as you normally get on a bowling scorecard.
  - The program auto-calculates the score after each frame and the bonuses after each roll, and advances the game as the user inputs their rolls:

```shell
# in irb - begin a new game
2.7.2 :001 > game = Game.new
 => #<Game:0x00007fc536d33030 @frame_class=Frame, @score_board=ScoreBoard, @current_frame=#<Frame:0x00007fc53...

# use the add roll method to input scores after each roll
2.7.2 :002 > game.add_roll(5)
 => 0

# score is returned after each roll, but doesn't update until current-frame is over
2.7.2 :003 > game.add_roll(4)
 => 9

2.7.2 :004 > game.add_roll(9)
 => 9

2.7.2 :005 > game.add_roll(1)
 => 19

# bonuses are added to the relevant frame (and the overall score) straight after the roll
2.7.2 :006 > game.add_roll(1)
 => 20
```

- The scoring system works identically to official bowling rules. Spare and strike bonuses are automatically added after the relevant roll has been taken:

```shell
# strike bonus - the next 2 rolls are added to the strike frame's score
2.7.2 :002 > game.add_roll(10)
 => 10

# strike bonus one (score + 6)
2.7.2 :003 > game.add_roll(6)
 => 16

# checking the bonus:
2.7.2 :004 > game.frames.last.bonus
 => 6

# strike bonus 2 (score + 4)
# overall score = 30 (10 for frame 1, 10 for frame 2, 10 bonus for frame 1)
2.7.2 :005 > game.add_roll(4)
 => 30

# checking our frames:
2.7.2 :006 > game.frames
 => [#<Frame:0x00007feacb8b4eb8 @bonus=10, @rolls=[10], @final=false, @remaining_pins=0>,
     #<Frame:0x00007feac8e1a180 @bonus=0, @rolls=[6, 4], @final=false, @remaining_pins=0>]

# spare bonus - the next roll is added to the spare frame's score
2.7.2 :007 > game.add_roll(7)
 => 37

# overall score now 46 (rolls = [10, 6, 4, 7, 2], bonus = [10, 7])
2.7.2 :008 > game.add_roll(2)
 => 46

2.7.2 :008 > game.frames
 => [#<Frame:0x00007feacb8b4eb8 @bonus=10, @rolls=[10], @final=false, @remaining_pins=0>,
     #<Frame:0x00007feac8e1a180 @bonus=7, @rolls=[6, 4], @final=false, @remaining_pins=0>,
     #<Frame:0x00007feac8c3aab8 @bonus=0, @rolls=[7, 2], @final=false, @remaining_pins=1>]
 ```

- ScoreBoard output for perfect game - total score:

```shell
2.7.2 :001 > game = Game.new
 => #<Game:0x00007f91e04c8c08 @frame_class=Frame, @score_board=ScoreBoard, @current_frame=#<Frame:0x00007f91e...
2.7.2 :002 > 12.times { game.add_roll(10) }
 => 12
2.7.2 :003 > game.score
 => 300
```
- And running total:

```shell
# ScoreBoard saves the frames in a class instance variable so scores can be retrieved directly
2.7.2 :004 > ScoreBoard.running_total
 => [30, 60, 90, 120, 150, 180, 210, 240, 270, 300]
```

Example of a stock-game in irb:

```shell
2.7.2 :001 > game = Game.new
 => #<Game:0x00007feac8ccda48 @frame_class=Frame, @score_board=ScoreBoard, @current_frame=#<Frame:0x00007feac8ccd9d0 @bonus=0, @rolls=[], @final=false, @remaining_pins=10>, @frames=[]>

# example game which should score 133 in total:
2.7.2 :002 > example_game = [1, 4, 4, 5, 6, 4, 5, 5, 10, 0, 1, 7, 3, 6, 4, 10, 2, 8, 6]
 => [1, 4, 4, 5, 6, 4, 5, 5, 10, 0, 1, 7, 3, 6, 4, 10, 2, 8, 6]

2.7.2 :003 > example_game.each do |roll|
2.7.2 :004 >   game.add_roll(roll)
2.7.2 :005 > end
 => [1, 4, 4, 5, 6, 4, 5, 5, 10, 0, 1, 7, 3, 6, 4, 10, 2, 8, 6]

# total score:
2.7.2 :007 > game.score
 => 133

# each roll is stored in its corresponding frame:
2.7.2 :006 > game.frames.map(&:rolls)
 => [[1, 4], [4, 5], [6, 4], [5, 5], [10], [0, 1], [7, 3], [6, 4], [10], [2, 8, 6]]

# running total / score-board total:
2.7.2 :008 > ScoreBoard.running_total
 => [5, 14, 29, 49, 60, 61, 77, 97, 117, 133]
```

- Game class uses dependency injection within an argument hash. This reduces dependency on the classes being passed in allowing them to be replaced with doubles in the isolated unit tests. The hash further reduces any dependency on the order the arguments are passed in.

```ruby
  def initialize(args = {})
    @frame_class = args[:frame_class] || Frame
    @score_board = args[:score_board] || ScoreBoard
    @current_frame = frame_class.new
    @frames = []
  end
```

- Testing:
  - 100% test coverage
  - TDD - all code written test first, using red green refactor approach
  - Unit tests are isolated and test each piece of individual logic, applying doubles and stubs where needed
  - Feature tests run the entire game through, asserting that the flow of the frames and the scoring is correct
  - Edge cases such as perfect games and gutter games are thoroughly tested
  - Tests are designed to focus on behaviour rather than state

- OOD:
  - Methods have been designed to be as simple and readable as possible
  - SRP: code is designed to follow single responsibility as much as possible, without impacting the readability and logical flow for the reader
  - Open / Closed principle: by choosing to inject my classes as hash argurments, the program is open for extension and closed for modification. Scoreboard can also be extended with additional score outputs if necessary

Agile and BDD:
  - [Sequence diagrams](#sequence-diagrams)
  - [class models](#class-models)

## Dependencies

Ruby version:
- `2.7.2`

Gems
-  `coveralls`
-  `reek`
-  `rspec`
-  `rspec-core`
-  `rubocop`
-  `simplecov`
-  `simplecov-console`

# Getting started

Clone this repositiory, install dependencies and load the spec_helper in irb

```shell
git clone git@github.com:AJ8GH/bowling-challenge-ruby.git
cd bowling-challenge-ruby
bundle
irb -r ./spec/spec_helper.rb
```

## Running tests

Use rspec to run tests:

```shell
rspec
```

Use the `-fd` flag to see format documentation output of tests:

```shell
rspec -fd
```

## Reflections

- Bowling is a deceptively complex game and ensuring short methods and classes which wouldn't generate code-smells took careful planning, thought and diagramming
- Doing this challenge again, I would likely approach it in a very similar way, particuarly the logic
- I would consider using one or 2 additional classes, particularly if I were to develop the app into a full stack web app with a front end user interface. I would also possibly design the public interfaces slightly differently in this case.
- This was a fairly tricky kata and I feel that it will be challenging to replicate in Javascript after only a week of learning the language!

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

### Sequence diagrams

Standard frame:

![standard frame](images/standard-frame.png)

Spare bonus:

![spare bonus](images/spare-bonus.png)

Strike bonus

![strike bonus](images/strike-bonus.png)

2 strike final frame

![2 strike final frame](images/2-strike-final-frame.png)

Final frame spare

![Final frame spare](images/final-frame-spare.png)

2 roll final frame

![2 roll final frame](images/2-roll-final-frame.png)

## Models

### Class models

Objects      | Messages
-------------|----------
Game         | game.roll
Game         | game.score -> sum of 2 rolls or 1 roll if strike
Game         | game.over
Game         | game.final_frame?
Game         | game.bonus
Frame        | frame.over?
Frame        | frame.stike?
Frame        | frame.spare?
Frame        | frame.final?
Frame        | frame.score -> sum of 2 rolls or 1 roll if strike
ScoreBoard   | self.total_score
ScoreBoard   | self.running_total

----

## Rules

### Basic functionality
- 1 player
- 10 frames
- Rolls per regular frame:
  - 1 if strike
  - 2 if *no* strike
- Rolls per final frame:
  - 2 if *no* spare or strike
  - 3 if spare or strike
- Score = number of pins *(+ strike / spare bonus)*

### Bonuses
- ***Strike bonus:***
  - Number of pins knocked down in next 2 rolls
- ***Spare bonus:***
  - Number of pins knocked down in next roll
- ***Final frame bonus***
  - Spare or strike in final frame results in 3 rolls total for that frame
  - Spare: 1 extra roll
  - Strike: 2 extra rolls

### Special games
- ***Perfect game:***
  - 12 strikes (10 + 2 bonus rolls)
  - 300 points
- ***Gutter game:***
  - 20 zero rolls
  - 0 points

### Edge cases
- Player can't input values equalling > 10 over 2 rolls of a frame
- Perfect game:
  - final 3 frames scoring table:

total score | frame | frame roll | frame bonus | frame score
------------|-------|------------|-------------|-------------
240         | 8     | 10         | 20          | 30
270         | 9     | 10         | 20          | 30
300         | 10    | 10 * 3     | n/a         | 30

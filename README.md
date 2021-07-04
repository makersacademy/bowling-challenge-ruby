Bowling Challenge in Ruby
=================

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

## My Solution
A Makers Week 5 solo weekend challenge. 

* **Languages used**: Ruby
* **Testing frameworks**: RSpec, Capybara
* **Linting**: Rubocop

### Domain Model
| Class | Game |
| --- | --- |
| **Properties (instance variables):** | @frames: Array (of 9 inst. Frames and 1 inst. FinalFrame) |
| **Actions (methods):** | roll(pins : Int) : Nil |
| | score : Int | 

| Class | Frame |
| --- | --- |
| **Properties (instance variables):** | @rolls : Array (of Roll instances) |
| **Actions (methods):** | ended? : Boolean |
| | add(roll : Roll) | 
| | score : Int | 
| | spare? : Boolean | 
| | strike? : Boolean |
| | roll_points(turn : Int) : Int | 

| Class | FinalFrame |
| --- | --- |
| **Properties (instance variables):** | @rolls : Array (of Roll instances) |
| **Actions (methods):** | ended? : Boolean |
| | add(roll : Roll) | 
| | score : Int | 
| | spare? : Boolean | 
| | strike? : Boolean |
| | roll_points(turn : Int) : Int | 
| | bonus_score : Int | 

| Class | Roll |
| --- | --- |
| **Properties (instance variables):** | @pins : Int |
| **Actions (methods):** | initialize(value) : @pins = value |

**Relationships**
* Game & Frame: 1 to 9
* Game & FinalFrame: 1 to 1
* Frame & Roll: 1 to (1..2)
* FinalFrame & Roll: 1 to (2..3)

### My approach
* I need to create a Game class that is able to roll a number of pins and calculate a score. I imagined how it would work in irb:
```
game = Game.new
20.times { game.roll(1) }
game.score                  # => 20
```
* Next I drafted my Domain Model:
  * Each Game has 10 frames, therefore perhaps Frame needs to be a class, and Game stores 10 different instances of Frame.
  * Each Frame has a default of 10 pins, originally I had implemented the number of pins outstanding in the frame, however I discovered that it was not necessary. Normal Frames end when 2 moves have been made or when there is a strike. 
  * Each Frame has 2 rolls, perhaps Roll needs to be a class, Frame works with 2 instances of Roll. 
  * Each roll can knock down a number of pins, so Roll may be instantiated with the number of pins knocked down, and should be accessible for reading. 
  * Each Frame has a score, excluding the bonus scores which may be handled by the `score` method in Game, because they are dependent on future frames. 
  * The Game should iterate through each Frame and sum each frame score plus bonus scores to give the final score.
  * The FinalFrame is a special frame that has up to 3 rolls. The game ends with 2 rolls if the first two rolls are less than 10. It also has an additional method that calculates the bonus_score for Game. Therefore it makes sense to have a FinalFrame class, similar to Frame but with special rules.
  * Please see above final Domain Model (Class Diagram).
* I TDD'd my code
* Tried to refactor where possible with SRP in mind. There are a few things I am not sure how to refactor the `score` method in Game.
* Tests are isolated early on using doubles and dependency injection.
* I feature tested using Capybara.
* Linted using Rubocop.

### How to use

Install gems using bundler:
```
bundle install
```

To run tests:
```
rspec
```

To run game in `irb`:
```irb
game = Game.new
game.roll(10)     # make a roll between 0 and 10
game.score        # calculate final score once you have made all your moves
```

### Improvements
* SRP
* Refactor unit tests
* Refactor code
* Use a mixin for Frame and FinalFrame's similar behaviour

# Bowling Challenge

[![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop) [![Ruby Style Guide](https://img.shields.io/badge/code_style-community-brightgreen.svg)](https://rubystyle.guide)

## Dependencies

Ruby version 2.6.5

### Gems

* coveralls
* rspec
* rubocop
* simplecov

## Code stats

90.4%
Code Climate maintainability score: B

## Description

The program is made up of the following classes:

* Game: this is the object that the user interacts with; it acts as a controller of the other classes in the program.
* Bowl: this object knows the number of pins knocked down by a player in a single throw.
* Frame: this object knows it's frame number, and which Bowls belong to that specific frame (and by extension, the number of pins knocked down in the frame). It also stores a FrameScore object (i.e. it knows the score for that frame)
* Game stores all of the frames that belong to the game; it also:
  * Keeps track of the current frame and bowl
  * Has an add_bowl method that allows the user to enter bowls
* ErrorChecker tests for edge cases, such as the user entering invalid numbers. This could be:
  * A negative number
  * A number greater than 10
  * A number on a second bowl that would cause the total for the round to exceed 10
* Framescore knows the score for a given frame. It also knows whether bonus bowls have been earned, and the bonus points earned.
* Scores is a hash table that holds the scores for each round and the total for the game.
* Display is for debugging/UI - it replicates a bowling scorecard.

Point to note:

* Bonus bowls are dealt with by frames being kept open for scoring if a player scores a strike or a spare. The number of bonus bowls is recorded for that particular frame. Every time a bowl is bowled, the first action taken by the program is to add the pins as a bonus to any frame that is still open for bonus bowls. The frame is closed once it has received the allowed number of bonus bowls (2 for a strike, 1 for a spare), at which point the score is finalised and added to the score table.

## Planning

### Program Behaviour

Bowling score programs tend to have the following behaviours:

* The only user input is to add bowl scores - the program keeps track of which frame and which bowl it is.
* If a player scores a strike, they do not have a second bowl for that frame. The program will increment the frame number immediately.
* The player sees the pins number of knocked down on the scoreboard for each throw, as it happens (rather than at the end).
* The player sees a running total of their score, frame by frame.
* Scores for frames where there are bonus bowls (i.e. if the player scores a strike or a spare) do not appear on the scoreboard until the bonus bowls have been thrown.
* An X is used to denote a strike and a / is used to denote a spare.

### Thoughts on program design

* Bowl object:
  * Stores the number of pins struck for that bowl
* Frame object
  * Knows the frame number
  * Stores the bowls for that frame in a hash
* Game object
  * Stores the frames for the game
  * Knows the current frame and bowl
  * Has a method to add number of pins knocked down in that bowl
* Score object
  * Stores all of the scores?
  * Knows the total score
* Scorer object
  * Calculates scores
* Display object?
  * Shows all bowls, frames, running total score:

| Current Frame: 5 | Current Bowl: 1 |
  
| 01 | 02 | 03 | 04 | 05 | 06 | 07 | 08 | 09 | 10  |
| -- | -- | -- | -- | -- | -- | -- | -- | -- | --- |
| X  | 54 | 7/ | 9- |    |    |    |    |    |     |
| 19 | 28 | 47 | 56 |    |    |    |    |    |     |
    
This would mainly be for debugging purposes at this stage - it's not meant as a user interface.

### Sequence Diagram

```
alias u = "User"
alias g = "Game"
alias d = "Display"
alias f = "Frame"
alias b = "Bowl"
alias s = "Score"
alias sr = "Scorer"

u->g:"start new game"
g->d:"create new display object"
g->g:"set current bowl to frame 1, bowl 1"
d-->g:"return new display object"
g-->u:"show display"
u-> g:"enter pins knocked down in bowl"
g->f:"if first bowl in frame, create new frame object"
f->b:"create new bowl object"
b->b:"store number of pins knocked down"
b-->f:"return bowl object"
f->f:"store bowl object"
f-->g:"return frame object"
g->g:"store frame object"
g->g:"check if second bowl allowed"
g->g:"update current bowl"
g->sr:"please update the score"
sr->sr:"perform calculation"
sr->s:"update total score (class method?)"
sr->g:"return total score"
g-->u:"update display" 
u->g:"enter pins knocked down in bowl"
g->b:"if second bowl, create new bowl object"
b->b:"store number of pins knocked down"
b-->g:"return bowl object"
g->f:"store bowl object in existing frame"
g->sr:"please update the score"
sr->sr:"perform calculation"
sr->s:"update total score (class method?)"
sr->g:"return total score"
g->g:"update current bowl"
g-->u:"update display"
```

![Image](./images/screenshot_1.png)

![Image](./images/screenshot_2.png)

## Reflection

I didn't plan enough for this. Initially I thought I could have a scoring object, where the score would be calculated, and treated that object as a black box in the planning. When it came to coding that class, I realised it would be difficult to implement if I wanted the program to behave in a similar way to normal bowling score calculators. I changed my plans at that point, and redesigned the program so that each frame would have a score object. This allowed me to keep a score object "open" if bonus bowls were earned.

However, I think I've overcomplicated the program, and my classes are not simple enough. The scoring was put together without much in the way of planning, and I think that probably shows.

I would like to refactor the program as follows:

* Increase test coverage.
* Reconsider the class responsibilities, and see if I can simplify the program.
* See if I can extract any more classes out from the game class - it might be better to have a Controller class, and a game object just stores the frames from the game.
* See if the display class can be simplified.
* Refactor so that pins are displayed for each bowl, rather than for each frame.

I think the code is generally quite well-written and DRY, but the program itself is hard to follow. I think I've made good use of dependency injection and of test doubles.

---

Bowling Challenge in Ruby
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

# Bowling Challenge

[![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop) [![Ruby Style Guide](https://img.shields.io/badge/code_style-community-brightgreen.svg)](https://rubystyle.guide)

## Description



## Planning

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
    
This would mainly be for debugging purposes - it's not meant as a user interface.

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

Bowling Challenge in Ruby
=================

## Getting Started
If not already installed, you will need ruby:
```
rvm get stable
rvm use ruby --latest --install --default
```

then, to run the file:
```
ruby lib/bowling_scorecard.rb
```
## Description

This is a simplistic program that count and sum the scores of a bowling game for one player. 
All he needs to do is to run the program in a CLI (until JavaScript come into play) and input the scores. 
He will be prompt with the context of the game in which he currently is and a scoreboard summing up the player scores will be displayed at the end of each frame.
The program will automatically detect strikes and spares and calculate totals and bonuses following the ten-pin bowling rules.

Player scored a STRIKES in frame 1. The game jump to frame 2
![](images/picture_1.jpg)

Player scored STRIKES in frame 2 and 3. The total score from the frame will not be shown until it has collected all the bonuses it is waiting for.
![](images/picture_2.jpg)

Player has scored 5 and 4 in frame 4. His strike streak is over and each total scores are ready to be evaluated. Note that they are cumulated from a frame to the next one.
![](images/picture_3.jpg)

Player has scored SPARES from frame 5 to 10. Same mechanic as strikes, total score is waiting for its bonus point before it is displayed.
![](images/picture_4.jpg)

Player scores STRIKES from in frame 10. Different prompts will be shown to the player to indicate that he is entitled extra rolls.
![](images/picture_5.jpg)

A ten-pin bowling perfect game!
![](images/picture_6.jpg)

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

![Ten Pin Score Example](images/example_ten_pin_scoring.png)

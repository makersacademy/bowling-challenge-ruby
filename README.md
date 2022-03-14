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

## Planning/notes

Used the below website to help me grasp the rules of the game: https://www.bowlinggenius.com/

I started writing user stories and diagramming to try and help plan the basic stuff first, then work my way to the more challenging aspects of the game.

```
As a Player
So that I can start playing a game of bowling
I want to be able to knock down 10 pins in a roll
```
```
As a Player
So that I can see the total score of my first frame
I would like the sum of my rolls
```
```
As a Player
So that I can keep track of my scores throughout the game
I would like to see my total score in each frame
```
```
As a Player
So that I can sabotage my game as a joke by hitting no pins
I want to be able to play a Gutter Game with 20 zero scores
```
```
As a Player
So that I can be rewarded if I get a strike (all 10 pins knocked down in one roll)
I would like the points scored in my next frame to be added to my roll score as a bonus
```
```
As a Player
So that I can be rewarded if I get a spare (all 10 pins knocked down in two rolls)
I would like the points scored in the next 1 roll to be added to my spare score as a bonus
```
```
As a Player
So that I show off my bowling skills 
I want to be able to play a Perfect Game with 12 strikes
```
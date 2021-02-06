Bowling Challenge in Ruby
=================

## The Task

**THIS IS NOT A BOWLING GAME, IT IS A BOWLING SCORECARD PROGRAM. DO NOT GENERATE RANDOM ROLLS. THE USER INPUTS THE ROLLS.**

Count and sum the scores of a bowling game for one player. For this challenge, you do _not_ need to build a web app with a UI, instead, just focus on the logic for bowling (you also don't need a database). Next end-of-unit challenge, you will have the chance to translate the logic to Javascript and build a user interface.

A bowling game consists of 10 frames in which the player tries to knock down the 10 pins. In every frame the player can roll one or two times. The actual number depends on strikes and spares. The score of a frame is the number of knocked down pins plus bonuses for strikes and spares. After every frame the 10 pins are reset.

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

## Planning
### Methodology
1. Gutter Game - 20 rolls - 0 score
2. Basic Game - 20 rolls - no spares or strikes
3. Strikes Game - 20 rolls - no strikes, spares in frames 1-9
4. Strikes Game - 21 rolls - spare in frame 10-roll 2, opportunity for 3rd roll
5. Planning tbc for strikes and perfect score

### Input/Output table
| Input | Output |
| --- | --- |
| [0] | [0] |
| [1] | [1] |
| [1,1] | [2] |
| [1,1,1] | [2,3] |
| [1,1,1,1,1] | [2,4,5] |
| [1,1,1,1,1,1,1] | [2,4,6,7] |
| [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0] | [0,0,0,0,0,0,0,0,0,0] |
| [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1] | [2,4,6,8,10,12,14,16,18,20] |
| [4,6,3,3] | [13,19]|
| [4,6,3,3,7,3,2,2,1,9,8,1,3,7,7,3,2,2,2,2] | [13,19,31,35,53,62,79,91,95,99]|
| [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1] | [2,4,6,8,10,12,14,16,18,20] |
| [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,9,1] | [2,4,6,8,10,12,14,16,18,29] |
| [4,6,8,2,2,9,1,9,9,1,6,4,9,1,5,5,5,5,6,4,7] | [18,30,41,60,76,95,110,125,141,158]
| [10,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1] | [12,14,16,18,20,22,24,26,28,30] |
| [10,3,4,10,2,2,10,0,2,10,3,4,10,3,3] | [17,24,38,42,54,56,73,80,96,102] |
| [10,3,4,3,7,3,3,10,3,3,9,1,7,1,10,1,1] | [17,24,37,43,59,65,82,90,102,104] |
| [10,9,1,2,3,10,5,5,8,2,1,4,10,9,1,2,2] | [20,32,37,57,75,86,91,111,123,127] |
| [10,10,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1] | [21,33,35,37,39,41,43,45,47,49] |
| [10,10,10,1,2,3,4,5,4,6,3,2,1,0,2,9,0] | [30,51,64,67,74,83,92,95,97,106] |
| [10,10,10,10,10,10,10,10,10,9,1,1] | [30,60,90,120,150,180,210,239,258,267] |
| [] | [] |
| [10,10,10,10,10,10,10,10,10,10] | [30,60,90,120,150,180,210,240,270,300] |

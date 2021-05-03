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

## Approach

### User Stories
```
As a player,
So that I know my scores
I would like to have a scorecard that gives me a list of my scores.
```
```
As a player, 
So I know my accomplishment, 
I would like to see my score total at the end of my game.
```
```
As a player, 
So i am scored for my strikes
I would like to see that I get bonus points from my next frame when I have a strike.
```
```
As a player, 
So I can track my spares, 
I would like to see that I get bonus points from my next roll when I have a spare.
```
```
As a player, 
So I know if i got a gutter game, 
I would like to see all my nil scores throughout the game.
```
```
As a player
So I know if I achieved a perfect game,
I would like to see all my scores, including my bonus points equal 300.
```
```
As a player, 
So I know when is the end of my game, 
I would like to see that I have played a total of 10 frames. 
```
```
As a player,
So I know what my last frame bonus is, 
I would like to see if I get any bonus points in my last frame. 
```

### Domain Modelling

Nouns | Property or owner of property? |
---------|----------|
 game | owner | 
 scorecare | owner | 

<br>

| Actions  | Owned by?  |
|--------- |----------- |
|roll | game |
|score_total |  scorecard|
|bonus_points | scorecard|
|strike? | game |
|spear? | game |
|last_game? | game|
|gutter_game? | game|

<br>



|Actions     | Property it reads or changes?    |
|--------- | ----------- |
|roll | @roll, @frame |
|score_total | @roll, total|
|bonus_points | @pins, @total, @frame |
|strike? | @pins, @frames, @roll? |
|spear? | @pins, @frames, @roll?  |
|last_game? | @frame, strike?, spare? |
|gutter_game? | @pins, @frames, @roll? |

<br>
<br>

<details>
<summary> Diagram Planning </summary>
<br>
<img src="/images/bowling_ruby_diagram.png">
</details>

<br>
<br>

## Bowling — how to play?

### How to set up the game




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
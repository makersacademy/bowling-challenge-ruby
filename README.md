# Bowling Challenge in Ruby

## The Task

**THIS IS NOT A BOWLING GAME, IT IS A BOWLING SCORECARD PROGRAM. DO NOT GENERATE RANDOM ROLLS. THE USER INPUTS THE ROLLS.**

Count and sum the scores of a bowling game for one player. For this challenge, you do _not_ need to build a web app with a UI, instead, just focus on the logic for bowling (you also don't need a database). Next end-of-unit challenge, you will have the chance to translate the logic to Javascript and build a user interface.

A bowling game consists of 10 frames in which the player tries to knock down the 10 pins. In every frame the player can roll one or two times. The actual number depends on strikes and spares. The score of a frame is the number of knocked down pins plus bonuses for strikes and spares. After every frame the 10 pins are reset.

**_STRONG HINT, IGNORE AT YOUR PERIL:_** Bowling is a deceptively complex game. Careful thought and thorough diagramming — both before and throughout — will save you literal hours of your life.

## Focus for this challenge

The focus for this challenge is to write high-quality code.

In order to do this, you may pay particular attention to the following:

- Using diagramming to plan your approach to the challenge
- TDD your code
- Focus on testing behaviour rather than state
- Commit often, with good commit messages
- Single Responsibility Principle and encapsulation
- Clear and readable code

10 frames (between 10-20 plays) - 10 pins (/100)
Strike == 10 pins/1 play
Spares == 10 pins/2 plays
10th Frame ==
Gutter game == 0 pins
Perfect game == 12 strikes (300 points)

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

points =

perfect game = 300 points
frames = 10

- 2 extra rolls of 10

logic

- perfect game - player should have 300 points
- player has 10 rolls (+2 bonus rolls) - so 12 rolls
  11-13
  12-14
  13-15
  14 -16
- player got five alternating strikes (everything else is 0, no bonus points) - 50 points
- player has 15 rolls (17 rolls if a strike happens in last round)

16 - 18
17 - 19
18 - 29

- player got one strike (everything else 0) - 10 points
- player has 19 rolls (21 rolls if strike is in last round)

- gutter game - player should have 0 points
- player has 20 rolls

- player got one spare (everythin else 0) - 10 points
- player has 20 rolls (21 rolls if strike is in last round)

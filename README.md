Bowling Challenge in Ruby
=================

For this challenge I followed a TDD approach to write a program that calculates the total score for a game of bowling, of a single player from a given array of pins knocked down by each roll.

With more time, I would like to ammend my program to be able to take the points from each roll to calculate the score as the game is played; by working out and saving each score to the total score array as it is entered.

Instructions
------------

Run `irb -r './lib/bowling.rb'` in the terminal, then input the scores for each frame as an array of sub-arrays, each value in each sub-array representing the number of pins knocked over by each ball roll. 

```sh
3.0.0 :001 > game = Bowling.new
 => #<Bowling:0x000000012c3c5208 @total_score=0>
3.0.0 :002 > game.total_frames([[10, 0], [1, 3], [0, 0], [3, 5], [2, 6], [10, 0], [9, 1], [7, 2], [1, 6], [1, 9],[6, 0]])
 => 103
```

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

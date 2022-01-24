Bowling Scorecard Challenge in Ruby
=================

My bowling scorecard program calculates the scores of a bowling game for one player. For this challenge, I was instructed to just focus on the logic for bowling, following the scoring rules below. Take a look at my Bowling Challenge Game so see a built user interface in Javascript for this Bowling scorecard game. 

## Instructions and Functionality
1. The Scorecard is initialised with a @frames array containing 10 arrays, with each inner array comprising of 2 values, or 3 if it is the 10th frame e.g. Scorecard.new([[4, 5], [3, 2], [3, 1], [2, 8], [4, 4], [10, 0], [2, 0], [10, 0], [10, 0], [10, 10, 3]]
2. Rolls should be entered into each frame array as individual elements and a strike is entered as [10, 0]. Example format:   
- [2, 3] if the 1st roll is 2 pins and 2nd roll is 3 pins 
- [5, 10, 4] if a strike is rolled as the 2nd roll of the final frame
- [5, 4, 0] if no strike or spare is rolled in the final frame
- [4, 6] is a spare
3. See examples of manual feature testing 
4. To see the bonus points of a particular frame, run the #bonus method with the frame index as the parameter i.e. to see the 3rd frame's bonus points, run .bonus(2)
5. To see the scores for each frame, run the #frame_scores method
6. To check if a frame is a strike or a spare, run the #strike? or #spare? methods respectively, giving the frame as a parameter i.e. strike?(frame: [10, 0]) or strike?(frame: scorecard.frames[5])

## Manual feature testing examples: 
p s = Scorecard.new([[4, 5], [3, 2], [3, 1], [2, 8], [4, 4], [10, 0], [2, 0], [10, 0], [10, 0], [10, 10, 3]])
p f = s.frames[5]
p s.strike?(frame: f)
p perfect = Scorecard.new([[10, 0], [10, 0], [0, 0], [10, 0], [10, 0], [10, 0], [10, 0], [10, 0], [10, 0], [10, 10, 10]])
p perfect.perfect_game?
p perfect.bonus(3) #should be 20
p perfect.bonus(1) #0
p s.bonus(5) #2
p s.bonus(3) #4
p s2 = Scorecard.new([[4, 5], [3, 2], [3, 1], [2, 8], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0]])
p s2.frame_scores #should be [9, 5, 4, 10, 0, 0, 0, 0, 0, 0]
p s.frame_scores #should be [9, 5, 4, 14, 8, 12, 2, 30, 30, 23]
p s.bonus(8) #should be 20
p s.bonus(9) #should be 0 

## Bowling scoring rules

A bowling game consists of 10 frames in which the player tries to knock down the 10 pins. In every frame the player can roll one or two times. The actual number depends on strikes and spares. The score of a frame is the number of knocked down pins plus bonuses for strikes and spares. After every frame the 10 pins are reset.

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

A Perfect Game is when the player rolls 12 strikes (10 regular strikes and 2 strikes for the bonus in the 10th frame). The Perfect Game scores 300 points. The scorecard for this game would have @frames array and @scores arrays as follows: 

``
@frames = [
    [30,0]
    [30,0]
    [30,0]
    [30,0]
    [30,0]
    [30,0]
    [30,0]
    [30,0]
    [30,0]
    [10,0]
    [10,0]
    [10,0]
]

@scores = [
    [30,0]
    [30,0]
    [30,0]
    [30,0]
    [30,0]
    [30,0]
    [30,0]
    [30,0]
    [30,0]
    [10,0]
    [10,0]
    [10,0]
]
``

In the image below you can find some score examples.

![Ten Pin Score Example](images/example_ten_pin_scoring.png)

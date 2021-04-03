Bowling Challenge in Ruby
=================

BOWLING SCORECARD PROGRAM


Count and sum the scores of a bowling game for one player.

A bowling game consists of 10 frames in which the player tries to knock down the 10 pins.
In every frame the player can roll one or two times. The actual number depends on strikes and spares. The score of a frame is the number of knocked down pins plus bonuses for strikes and spares. After every frame the 10 pins are reset.


## Focus for this challenge
The focus for this challenge is to write high-quality code.
In order to do this, you may pay particular attention to the following:
[ ] Using diagramming to plan your approach to the challenge
[ ] TDD your code
[ ] Focus on testing behaviour rather than state
[ ] Commit often, with good commit messages
[ ] Single Responsibility Principle and encapsulation
[ ] Clear and readable code

---
## Bowling rules

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

---

### Modelling

### To-Do:
[ ] roll 2 cannot be played if roll 1 is a strike
[ ] value of roll 2 cannot be a number where, when added to roll 1 value, it will equal more than 10
[ ]


### irb
#regular play:
require './lib/bowling_game.rb'
game = BowlingGame.new
game.roll_1(4)
 => "Nice roll! Let's Roll again!"
game.roll_2(3)
 => "Great Job! That's the end of this frame"

game.view_scorecard
 => [{"frame_1"=>{:roll_1=>4, :roll_2=>3, :roll_3=>nil, :bonus_score=>0, :total=>7}}]


#gets a strike:
game.roll_1(10)
=> "Strike!"
game.strike
=> true
game.roll_1(4)
game.roll_2(3)
game.view_scorecard
=>
=> [
{"frame_1"=>{:roll_1=>4, :roll_2=>3, :roll_3=>nil, :bonus_score=>0, :total=>7}}, {"frame_2"=>{:roll_1=>10, :roll_2=>0, :roll_3=>nil, :bonus_score=>7, :total=>24}}, {"frame_3"=>{:roll_1=>4, :roll_2=>3, :roll_3=>nil, :bonus_score=>0, :total=>31}}]

game.strike
=> false

# gets a spare:
game.roll_1(3)
=> "Nice roll! Let's Roll again!"
game.roll_2(7)
 => "Spare!"
game.roll_1(4)
=> "Nice roll! Let's Roll again!"
game.roll_2(3)
 => "Great Job! That's the end of this frame"
game.view_scorecard
=> [
{"frame_1"=>{:roll_1=>4, :roll_2=>3, :roll_3=>nil, :bonus_score=>0, :total=>7}}, {"frame_2"=>{:roll_1=>10, :roll_2=>0, :roll_3=>nil, :bonus_score=>7, :total=>24}}, {"frame_3"=>{:roll_1=>4, :roll_2=>3, :roll_3=>nil, :bonus_score=>0, :total=>31}}, {"frame_4"=>{:roll_1=>3, :roll_2=>7, :roll_3=>nil, :bonus_score=>4, :total=>45}}, {"frame_5"=>{:roll_1=>4, :roll_2=>3, :roll_3=>nil, :bonus_score=>0, :total=>52}}]

# plays 10 frames
game.roll_1(3)
game.roll_2(7)
game.roll_1(4)
game.roll_2(3)
game.roll_1(10)
game.roll_2(7)
game.roll_3(4)
=> "end of game"

game.scorecard
=> [
{"frame_1"=>{:roll_1=>4, :roll_2=>3, :roll_3=>nil, :bonus_score=>0, :total=>7}}, {"frame_2"=>{:roll_1=>10, :roll_2=>0, :roll_3=>nil, :bonus_score=>7, :total=>24}}, {"frame_3"=>{:roll_1=>4, :roll_2=>3, :roll_3=>nil, :bonus_score=>0, :total=>31}}, {"frame_4"=>{:roll_1=>3, :roll_2=>7, :roll_3=>nil, :bonus_score=>4, :total=>45}}, {"frame_5"=>{:roll_1=>4, :roll_2=>3, :roll_3=>nil, :bonus_score=>0, :total=>52}}, {"frame_6"=>{:roll_1=>3, :roll_2=>7, :roll_3=>nil, :bonus_score=>4, :total=>66}}, {"frame_7"=>{:roll_1=>4, :roll_2=>3, :roll_3=>nil, :bonus_score=>0, :total=>73}}, {"frame_8"=>{:roll_1=>10, :roll_2=>0, :roll_3=>nil, :bonus_score=>7, :total=>90}}, {"frame_9"=>{:roll_1=>10, :roll_2=>7, :roll_3=>nil,:bonus_score=>0, :total=>107}},
{"frame_10"=>{:roll_1=>10, :roll_2=>7, :roll_3=>4, :bonus_score=>0, :total=>128}}]

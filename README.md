Bowling Challenge in Ruby
=================

## The Task

**THIS IS NOT A BOWLING GAME, IT IS A BOWLING SCORECARD PROGRAM. DO NOT GENERATE RANDOM ROLLS. THE USER INPUTS THE ROLLS.**

Count and sum the scores of a bowling game for one player. For this challenge, you do _not_ need to build a web app with a UI, instead, just focus on the logic for bowling (you also don't need a database). Next end-of-unit challenge, you will have the chance to translate the logic to Javascript and build a user interface.

A bowling game consists of 10 frames in which the player tries to knock down the 10 pins. In every frame the player can roll one or two times. The actual number depends on strikes and spares. The score of a frame is the number of knocked down pins plus bonuses for strikes and spares. After every frame the 10 pins are reset.


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

## Scenari:

# If a player scores 10 points in one roll  => move onto next frame.
                                            => score = 10 + [next roll] + [roll after that]

# If a player scores 10 points in two rolls (within a frame) => score = 10 + [next roll]

# If Frame = 10 && Frame(Roll 1) = 10 => allow two further rolls and add to score

# If Frame = 10 && Frame(Roll 1) + Frame(Roll 2) = 10, allow one further roll and add to score

Example game:

Frame | Roll | Pins knocked down | Total score
------+------+-------------------+--------------
   1  |  1   |          1        |   
   1  |  2   |          4        |      5

   2  |  1   |          4        |
   2  |  2   |          5        |      14

   3  |  1   |          6        |
   3  |  2   |          4        |      24 + 5 = 29

   4  |  1   |          5        |        
   4  |  2   |          5        |      39 + 10 = 49 

   5  |  1   |          10       |      
   5  |  2   |                   |      59 + 0 + 1 = 60

   6  |  1   |          0        |
   6  |  2   |          1        |      61

   7  |  1   |          7        |
   7  |  2   |          3        |      71 + 6 = 77
   
   8  |  1   |          6        |
   8  |  2   |          4        |      87 + 10 = 97

   9  |  1   |          10       |      
   9  |  2   |                   |      107 + 2 + 8 = 117

   10 |  1   |          2        |      
   10 |  2   |          8        |      
   10 |  3   |          6        |      133

## Methods:

# 1. Frame no. is initially set to 1.
# 2. Score is initially set to 0.
# 3. Player is asked to enter the number of pins knocked down after first roll.
    # If roll_1 = 10:
        # 10 is added to score;
        # Frame no. is increased by 1;
        # Repeat step 3 and double pins knocked down in next two rolls.
    # If roll_1 < 10...
# 4. Player is asked to enter the number of pins knocked down after second roll.
    # If roll_1 + roll_2 = 10:
        # 10 is added to score;
        # Frame no. is increased by 1;
        # Repeat step 3 and double pins knocked down in next roll.
    # If roll_1 + roll_2 < 10:
        # roll_1 + roll_2 is added to score;
        # Frame no. is increased by 1;
        # Repeat step 3.
# 5. When Frame no. reaches 10
    # Player is asked to enter the number of pins knocked down after first roll.
        # If roll_1 = 10:
            # 10 is added to score;
            # Player is allowed another roll;
                #If roll_2 = 10:
                    # 10 is added to score;
                    # Player is allowed a final roll;
                    # Final roll amount is added to score.
        # If roll_1 < 10...
    # Player is asked to enter the number of pins knocked down after second roll.
        # If roll_1 + roll_2 = 10:
            # 10 is added to score;
            # Player is allowed a final roll;
            # Final roll amount is added to score.
        # If roll_1 + roll_2 < 10:
            # roll_1 + roll_2 is added to score;
            # Game ends.

class Bowling
  def initialize
    @score = []
    @frame_no = 1 # game ends when frame_no = 11
  end

  def frame(roll_1, roll_2) # roll_1 and roll_2 are integers 
                            # entered by player.
    frame_score = roll_1 + roll_2
    # frame_score gets added to total score array
    @score << frame_score
    @no_of_frames += 1
  end

  def score_so_far
    @score.sum
  end

  def frame_no
    @frame_no
  end
end


## Example tests:

# 1. Adds score to array

game = Bowling.new
game.frame(4, 5)
game.score_so_far # => 9

# 2. Increases frame_no by 1

game = Bowling.new
game.frame(4, 5)
game.frame_no # => 2

# 3. Adds double the next frame score to total score after strike

game = Bowling.new
game.frame(10, 0)
game.frame(5, 4)
game.score_so_far # => 28

# 4. Adds double the first roll in next frame to total score after spare

game = Bowling.new
game.frame(6, 4)
game.frame(5, 4)
game.score_so_far # => 24

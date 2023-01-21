# Since I know this code will be reviewed, and we will be using it for week 6
# I thought it best to add comments with regards to functionality

class BowlingScoreCard
  def initialize
    # individual entries of each roll score will be stored here
    @each_roll_score_array = []
  end

  # sends number of pins knocked down to array
  def roll(pins_down)
    @each_roll_score_array << pins_down
  end

  # manages the logic in relation to whether a frame is normal, spare or strike
  # roll_number is used to access the relevant roll score in the each_roll_score_array
  def overall_score
    @score = 0
    @roll_number = 0
    # 10.times handles the amount of frames for the game
    10.times do
      # see private methods for frame_type_conditional
      frame_type_conditional
    end
    @score
  end
  
  private

  # adds the two rolls in a frame (called if not a strike)
  def sum_pins_down_in_frame(roll_number)
    @each_roll_score_array[roll_number] + @each_roll_score_array[roll_number + 1]
  end

  # handles the additional scoring following a spare frame
  def spare_bonus_score(roll_number)
    @each_roll_score_array[roll_number + 2]
  end

  # calculates whether a frame is a spare frame
  def a_spare?(roll_number)
    @each_roll_score_array[roll_number] + @each_roll_score_array[roll_number + 1] == 10
  end

  # calculates whether a frame is a strike frame
  def a_strike?(roll_number)
    @each_roll_score_array[roll_number] == 10
  end

  # handles the additional scoring following a strike frame
  def strike_bonus_score(roll_number)
    @each_roll_score_array[roll_number + 1] + @each_roll_score_array[roll_number + 2]
  end

  # handles the logic in relation to frame type
  def frame_type_conditional
    if a_strike?(@roll_number)
      @score += 10 + strike_bonus_score(@roll_number)
      @roll_number += 1
    elsif a_spare?(@roll_number)
      @score += 10 + spare_bonus_score(@roll_number)
      @roll_number += 2
    else
      @score += sum_pins_down_in_frame(@roll_number)
      @roll_number += 2
    end
  end

end

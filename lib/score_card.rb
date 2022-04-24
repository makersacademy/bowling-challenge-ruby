require_relative 'frame'

class Scorecard
  attr_accessor :frames

  def initialize
   @frames = []
  end

  def add_frame(frame)
    @frames << frame
    calculate_bonus_points
  end

  def calculate_bonus_points
    num_frames = @frames.count
    return if num_frames == 1 

    previous_frame = @frames[num_frames - 2]
    current_frame = @frames[num_frames - 1]
    second_last_frame = @frames[num_frames - 3] if num_frames > 2
 
    if previous_frame.spare?
      previous_frame.add_bonus_points(current_frame.roll_1)
    end

    if previous_frame.strike?
      previous_frame.add_bonus_points(current_frame.roll_1)
      if (current_frame.roll_2 != nil)
        previous_frame.add_bonus_points(current_frame.roll_2)
      end
    end
 
    if previous_frame != nil && second_last_frame != nil && previous_frame.strike? && second_last_frame.strike?
      previous_frame.add_bonus_points(current_frame.roll_1)
    end
  end

  def calculate_score
    score = 0
    @frames.each { |frame| score += frame.frame_score }
  return score
  end
end

require 'frame'

class Game
  def initialize()
    @frames = []
    @frame_number = 0
    @total_score = 0
  end
   
  def add_all_frames(frame)
    while @frames.length < 10
      @frames << frame
    end
  end

  def frame_scores
    return @frames.map(&:frame_points)
  end
# ' [5, 3], [5, 3], [5, 3], [5, 3], [5, 3], [5, 3], [5, 3], [5, 3], [5, 3], [5, 3]])'


  def total_score
    return @total_score
  end

  def strike_points
    @total_score += 10
    # We have a full array of arrays 
    # We want to check if Frame_1 roll_one contains a 10
    # If it does, we want to add the points from frame_2 (roll_one and roll_two)*2
    # If frame_2 also has a roll_one == 10, then add frame_three [roll_one]
    next_frame = @frames[@current_frame+1]
    if next_frame == nil
    else
      @total_score += next_frame.frame_point
    end
  end
end

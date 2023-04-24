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

  def frame_scores # array of arrays
    return @frames.map(&:frame_points)
  end

  def total_score # takes array of arrays and just returns the total score
    @frames.map(&:frame_points).flatten.sum
  end

  def calculate_score
    @total_score = 0
    @frames.each_with_index do |frame, index|
      if index == 9 # Handle the last frame separately
        @total_score += frame.frame_points.sum
        break
      elsif frame.strike? # Strike
        if index == 2 # Special case for frame 3
          @total_score += frames[3].frame_points[0] + frames[3].frame_points[1] + 10
        else
          @total_score += frames[index+1].frame_points[0] + frames[index+1].frame_points[1].to_i + 10
        end
      elsif frame.spare? # Spare
        @total_score += frames[index+1].frame_points[0] + 10
      else # Open frame
        @total_score += frame.frame_points.sum
      end
    end
    @total_score
  end  
end

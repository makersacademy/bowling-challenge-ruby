require 'frame'

class Scorecard
  def initialize()
    @frames = []
    @frame_number = 0
    @total_score = 0
  end
   
  def add_frame(frame)
      @frames << frame
  end

  def frame_scores # array of arrays
    return @frames.map(&:frame_points)
    # @frames.map(&:frame_points).flatten.sum <- totals the score in array of arrays
  end

  def strike_or_spare(frame, index)
    # Below deals with first ball bonus
    @total_score += frame.frame_points[index+1][0] 
    # We now want to check if the first ball is a strike
    if frame.strike?
      if frame.frame_points[index+1][0].strike?
        @total_score += frame.frame_points[index+2][0]
      else
        @total_score += frame.frame_points[index+1][1]
      end
    end
  end

  def calculate_score
    @total_score += @frames.map(&:frame_points).flatten.sum
    @frames.each_with_index do |frame, index|
      while frame.index < 9 do
        if frame.strike? || frame.spare?
          strike_or_spare(frame, index)
        end
        if if frame[index+8][0] == 10
          bonus_third_roll
        end
      end
    end
    return @total_score
  end

  def bonus_third_roll(frame, index)
      @total_score += frame[index+9][0]
      @total_score += frame[index+9][1]
    end
  end

end

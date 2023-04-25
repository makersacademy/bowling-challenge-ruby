require 'frame'

class Scorecard
  def initialize()
    @frames = []
    @frame_number = 0
    @total_score = 0
  end
   
  def add_frame(frame)
    while @frames.length < 10
      @frames << frame
    end
  end

  def frame_scores # array of arrays
    return @frames.map(&:frame_points)
    # @frames.map(&:frame_points).flatten.sum <- totals the score in array of arrays
  end

  def strike_score
    if frame.frame_points[0] == 10
      @total_score += frame[index].(frame_pointsframe[index+1])*2
    end
  end

  def frame_strike_checker
    @frames.each_with_index do |frame, index|
      if frame.strike? == true
        return 'strike'
      end
    end
  end


  def frame_spare_checker
    @frames.each_with_index do |frame, index|
      if frame.spare? == true
        return 'spare'
      end
    end
  end

  def calculate_score
    @total_score = 0
    @frames.each_with_index do |frame, index|
      if frame.strike?
      end
    end
  end
end

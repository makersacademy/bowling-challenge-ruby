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

  def strike_score(frame, index)
    if frame.frame_points[0] == 10
      @total_score += frame[frame_points][index+1].sum * 2
    end
  end

  def calculate_score
    @frames.each_with_index do |frame, index|
      if strike_or_spare_checker(frame) == 'strike'
        strike_score(frame, index)
      else
        @total_score += frame.frame_points.sum
      end
    end
    return @total_score
  end

  def tenth_frame
    if frame[9].frame_points[0] == 10 #10th frame is strike
      @total_score += frame[9].frame_points.sum
      if frame[9].frame_points.sum == 10 # bonus roll is a strike
        @total_score += 10
      else
        @total_score += frame[9].frame_points[2] # add on the second roll if pins remaining
      end
    elsif frame[9].frame_points.sum == 10 # 10th frame is a spare
      @total_score += frame[9].frame_points.sum
      @total_score += frame[9].roll_three
    else # 10th frame is neither strike/spare
      @total_score += frame[9].frame_points.sum
    end
    return @total_score
  end


  end

  private

  def strike_or_spare_checker
    @frames.each_with_index do |frame, index|
      if frame.strike? == true
        return 'strike'
      elsif
        frame.spare? == true
        return 'spare'
      end
    end
  end
end

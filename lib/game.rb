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
      end
    end
    return @total_score
  end

#   # If frame strike or spare only until the 10th frame
#   def tenth_frame
#     if frame[9].frame_points[0] == 10 #10th frame is strike
#       @total_score += frame[9].frame_points.sum
#       if frame[9].frame_points.sum == 10 # bonus roll is a strike
#         @total_score += 10
#       else
#         @total_score += frame[9].frame_points[2] # add on the second roll if pins remaining
#       end
#     elsif frame[9].frame_points.sum == 10 # 10th frame is a spare
#       @total_score += frame[9].frame_points.sum
#       @total_score += frame[9].roll_three
#     else # 10th frame is neither strike/spare
#       @total_score += frame[9].frame_points.sum
#     end
#     return @total_score
#   end
end

class Scorecard
  def initialize
    @frame_arr = []
    @score_arr = []
  end

  def frame_add(frame)
    @frame_arr << frame
  end

  def frame_arr
    @frame_arr
  end

  def score
    score = 0
    @frame_arr.each_with_index do |frame, frame_no|
      next_frame = @frame_arr[frame_no + 1]
      next_frame_2 = @frame_arr[frame_no + 2]
      if frame_no < 9
        if frame.is_strike?
          if next_frame.is_strike?
            score += frame.sum_rolls + next_frame.sum_rolls + next_frame_2.roll1
            next
          else
            score += frame.sum_rolls + next_frame.sum_rolls
            next
          end
        end
        if frame.is_spare?
          score += frame.sum_rolls + next_frame.roll1
          next
        end
        score += frame.sum_rolls
      end
      if frame_no >= 9
        score += frame.sum_rolls
        next
      end
      frame_no += 1
    end
    score
  end
  
  def sum_score(frame_sum)
    @score_arr << frame_sum
  end

  def score_arr
    @score_arr
  end
end

# # score_arr.map(&:to_i).reduce(0, :+)
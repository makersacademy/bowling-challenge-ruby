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
    @frame_arr.each_with_index do |frame, n|
      next_frame = @frame_arr[n+1]
        if frame.is_strike?
          score += next_frame.sum_rolls + 10
          next
        end
        if frame.is_spare?
          score += next_frame.roll1 + 10
          next
        end
      score += frame.sum_rolls
    end
    score
  end

  
  def sum_score(frame_sum)
    @score_arr << frame_sum
  end

  def score_arr
    @score_arr
  end

  def final_score
    sum = 0
    @score_arr.each do |frame|
      sum += frame
    end
    sum
  end
end

# # score_arr.map(&:to_i).reduce(0, :+)
# def spare_bonus
#   # raw_score_arr.each do |frame|
#   #   if frame.include?('/')

# end

# def strike_bonus
#   # Takes strike (X) from rolls_arr
#   # Adds roll1 & roll2* of frame n+1, returns to scorecard_arr
#   # If roll1 of frame n+1 is also a strike, adds roll1 of frame n+2
# end
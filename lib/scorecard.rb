require 'frame'

class Scorecard
  def initialize
    @raw_score_arr = []
    @score_arr = []
  end

  def add_frames(frame)
    @raw_score_arr << frame
  end

  def raw_score_arr
    @raw_score_arr
  end

  def spare_bonus
    # Looks for spare (/) from frame in raw_score_arr
    # Adds roll1 of frame n+1 to spare, returns to score_arr
  end

  def strike_bonus
    # Takes strike (X) from rolls_arr
    # Adds roll1 & roll2* of frame n+1, returns to scorecard_arr
    # If roll1 of frame n+1 is also a strike, adds roll1 of frame n+2
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
      frame = frame.to_i
      sum += frame
    end
    sum
  end
end

# score_arr.map(&:to_i).reduce(0, :+)
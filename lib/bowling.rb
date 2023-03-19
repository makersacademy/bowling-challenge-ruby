class Bowling
  attr_reader :rolls
  
  def initialize
    @rolls = []
  end

  def roll(pins)
    @rolls.push(pins)
  end

  def score
    total_points = 0
    frame_index = 0

    (0..9).each do |single_frame|
      total_points += sum_of_points_in_frame(frame_index)
      frame_index += 2
    end

    return total_points
  end

  def sum_of_points_in_frame(frame_index)
    return @rolls[frame_index] + @rolls[frame_index + 1]
  end
end
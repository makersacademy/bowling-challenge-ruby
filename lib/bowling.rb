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
      if @rolls[frame_index] == 10 
        total_points += (10 + @rolls[frame_index + 1] + @rolls[frame_index + 2])
        frame_index += 1
      elsif @rolls[frame_index] + @rolls[frame_index + 1] == 10
        total_points += (10 + @rolls[frame_index + 2])
        frame_index += 2
      else
        total_points += (@rolls[frame_index] + @rolls[frame_index + 1])
        frame_index += 2
      end
    end

    return total_points
  end
end
require 'frame'

class Game
  attr_reader :frames

  def initialize
    @frames = []
  end

  def calculate_current_score
    score = 0
    @frames.each { |frame|
      score += (frame.first_roll + frame.second_roll)
    }
    return score
  end

  def add_frame(first_roll, second_roll)
    @frames << Frame.new(first_roll, second_roll) if @frames.length < 10
  end
end

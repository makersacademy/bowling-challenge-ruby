require 'frame'

class Game
  attr_reader :frames

  def initialize
    @frames = []
  end

  def calculate_current_score
  end

  def add_frame(first_roll, second_roll)
    @frames << Frame.new(first_roll, second_roll) if @frames.length < 10
  end
end
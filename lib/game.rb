require_relative './frame'
require_relative './score'

class Game
  attr_accessor :frames

  def initialize
    @frames = [
      Frame.new(1),
      Frame.new(2),
      Frame.new(3),
      Frame.new(4),
      Frame.new(5),
      Frame.new(6),
      Frame.new(7),
      Frame.new(8),
      Frame.new(9),
      Frame.new(10),
    ]
  end

  def total_score
    Score.new(frames).total_score
  end
end
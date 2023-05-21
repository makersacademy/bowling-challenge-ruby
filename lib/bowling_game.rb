require 'frame'

class BowlingGame
  attr_reader :frames, :total_score

  def initialize
    @frames = []
    @total_score = 0
  end
end
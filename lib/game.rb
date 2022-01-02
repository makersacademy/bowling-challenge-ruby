require 'frame'

class Game
  attr_reader :score, :frames

  def initialize(frame = Frame)
    @score = 0
    @frames = []
  end

  def score
    @score = @frames.reduce(0) { |total, frame| total + frame.score }
  end
end
require_relative 'frame'

class Game 
  attr_reader :score, :frames, :frame_scores

  def initialize 
    @score = 0
    @frames = [Frame.new]
    @frame_score = 0
    @frame_scores = []
  end

  def roll(pins)
  end

  def add_frame
    @frames << Frame.new unless frames.length == 10
  end

  def gameover?
    @frame_scores.length == 10 ? true : false
  end
end

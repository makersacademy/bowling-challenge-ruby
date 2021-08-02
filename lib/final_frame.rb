require_relative 'score'

class FinalFrame
  attr_reader :score, :round, :spare, :strike
  attr_accessor :frame_score
  def initialize(round:)
    @round = round
    @score = Score.new
    @frame_score
    @spare = @score.spare
    @strike = @score.strike
  end

  def first_roll(pins:)
  end
  
  def second_roll(pins:)
  end

  def calculate_score
  end
end
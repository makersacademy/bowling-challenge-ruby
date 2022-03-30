require_relative 'score'

class Frame
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
    @score.first_roll(pins: pins)
  end
  
  def second_roll(pins:)
    @score.second_roll(pins: pins)
  end

  def calculate_score
      @frame_score = @score.calculate_score
  end
end
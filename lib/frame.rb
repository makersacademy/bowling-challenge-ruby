require_relative 'score'

class Frame
  attr_reader :score, :round
  def initialize(round:)
    @round = round
    @score = Score.new
  end

  def first_roll(pins:)
    @score.first_roll(pins: pins)
  end
  
  def second_roll(pins:)
    @score.second_roll(pins: pins)
  end
end
class Game

  attr_reader :scorecard

  def initialize
    @scorecard = []
  end

  def roll(pins)
    @scorecard << pins
  end

  def score
    @scorecard.sum
  end

end
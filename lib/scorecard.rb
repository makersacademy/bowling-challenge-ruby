class Scorecard

  attr_accessor :rolls

  def initialize
    @rolls = []
  end

  def roll(pins)
    @rolls << pins
  end

  def score
    @rolls.inject(:+)
  end

end

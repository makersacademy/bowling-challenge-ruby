class Bowling

  def initialize
    @rolls = []
  end

  def roll(pins)
    @rolls << pins
  end

  def score
    @rolls.reduce(:+)
  end
end

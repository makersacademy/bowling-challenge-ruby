class Bowling
  def initialize
    @rolls = []
  end

  def roll(pin)
    @rolls.push(pin)
  end

  def score
    @rolls.sum
  end
end

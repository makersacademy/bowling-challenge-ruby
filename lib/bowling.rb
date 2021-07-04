class Bowling
  def initialize
    @rolls = []
  end

  def roll(pin)
    @rolls.push(pin)
  end

  def score
    0
  end
end

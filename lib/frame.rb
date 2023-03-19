class Frame
  def initialize
    @rolls = []
  end

  def add_roll(pins)
    @rolls << pins
  end

  def score
    @rolls.sum
  end

  def strike?
    @rolls[0] == 10 && @rolls.length == 1
  end

  def spare?
    score == 10 && @rolls.length == 2
  end
end


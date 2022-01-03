class Frame

  def initialize
    @rolls = []
  end

  def roll(pins)
    @rolls << pins
  end

  def rolls
    @rolls.dup
  end

  def strike?
    @rolls[0] == 10
  end

  def spare?
    strike? ? false : @rolls.sum == 10
  end

end
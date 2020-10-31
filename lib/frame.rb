class Frame
  def initialize
    @rolls = []
    @bonus_rolls = []
  end

  def roll(n)
    @rolls.push(n)
  end

  def pins
    @rolls.sum
  end

  def strike?
    @rolls.first == 10
  end
end

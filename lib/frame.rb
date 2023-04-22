class Frame
  def initialize
    @rolls = []
  end

  def roll_one(pins)
    @rolls << pins
  end

  def roll_two(pins)
    @rolls << pins
  end

  def strike?
    @rolls.first == 10
  end

  def spare?
    @rolls.sum == 10 && @rolls.size == 2
  end
end
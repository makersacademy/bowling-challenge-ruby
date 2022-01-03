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

end
class Frame
  attr_reader :score, :rolls, :pins_down

  def initialize(rolls)
    @rolls = rolls
    @score = 0
    @pins_down = rolls.sum
  end

  def score
    return @pins_down
  end

  def strike?
    return @rolls == [10]
  end

  def spare?
    return @rolls.length == 2 && @rolls.sum == 10
  end
end
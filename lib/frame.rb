class Frame

  DEFAULT_MAX = 2

  attr_reader :bonus

  def initialize
    @rolls = []
    @max_rolls = DEFAULT_MAX
    @bonus = 0
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
    score == 10 && !strike?
  end

  def complete?
    strike? || @rolls.length == @max_rolls
  end

  def score
    @rolls.sum
  end

  def add_bonus(bonus)
    @bonus += bonus
  end

end
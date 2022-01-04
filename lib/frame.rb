class Frame

  DEFAULT_MAX = 2

  attr_reader :bonus, :extra

  def initialize
    @rolls = []
    @scoring_rolls = []
    @max_rolls = DEFAULT_MAX
    @bonus = 0
    @extra = false
  end

  def roll(pins)
    @scoring_rolls << pins
    @rolls << pins
  end

  def non_scoring_roll(pins)
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
    (@max_rolls == DEFAULT_MAX && strike?) || @rolls.length == @max_rolls
  end

  def score
    @scoring_rolls.sum
  end

  def add_bonus(bonus)
    @bonus += bonus
  end

  def extra_roll
    @max_rolls = 3
    @extra = true
  end

end
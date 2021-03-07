class Frame
  attr_reader :rolls, :base_score, :final_score

  def initialize(*args)
    @rolls = args
    @base_score = @rolls.sum
    @final_score = @rolls.sum
  end

  def is_strike?
    @rolls.first == 10
  end

  def is_spare?
    !is_strike? && @rolls.sum == 10
  end

  def add_bonus(bonus)
    @final_score += bonus
  end

end

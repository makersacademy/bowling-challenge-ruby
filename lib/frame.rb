class Frame
  def initialize(rolls)
    @rolls = rolls
    @total_score = 0
  end

  def total_score
    @total_score
  end

  def spare?
    return @rolls.length == 2 && @rolls.sum == 10
  end
end
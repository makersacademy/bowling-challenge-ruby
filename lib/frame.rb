class Frame
  attr_reader :total_score, :rolls

  def initialize(rolls)
    @rolls = rolls
    @total_score = 0
  end

  def strike?
    return @rolls == [10]
  end

  def spare?
    return @rolls.length == 2 && @rolls.sum == 10
  end
end
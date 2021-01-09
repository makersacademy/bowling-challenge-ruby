class Frame

  attr_reader :throws, :total_score

  def initialize
    @throws = []
    @total_score = 0
  end

  def add_roll_score(pins)
    @throws << pins
  end

  def strike?
    @throws[0] == 10
  end

  def spare?
    @throws.sum == 10 && !strike?
  end

  def add_total_score(amount)
    @total_score += amount
  end

end

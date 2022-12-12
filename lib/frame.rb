class Frame
  attr_reader :roll1, :roll2

  def initialize(roll1, roll2)
    @roll1 = roll1
    @roll2 = roll2
  end

  def score
    @roll1 + @roll2
  end

  def spare?
    score == 10 && roll1 != 10
  end

  def strike?
    @roll1 == 10
  end
end


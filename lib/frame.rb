class Frame

  attr_reader :bonus_rolls
  attr_accessor :score

  def initialize
    @score = 0
    @bonus_rolls = 0
  end

  def add_score(amount)
    self.score += amount
  end

end

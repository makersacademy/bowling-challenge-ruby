class Frame

  attr_accessor :score, :bonus_rolls

  def initialize
    @score = 0
    @bonus_rolls = 0
  end

  def add_score(amount)
    self.score += amount
  end

end

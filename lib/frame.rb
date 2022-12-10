class Frame
  def initialize
    @score = 0
  end

  def add_roll(roll)
    @score += roll
  end

  def score
    return @score
  end
end

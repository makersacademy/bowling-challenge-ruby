class BowlingGame

  def initialize
    # Empty array that contains no 'rolls' when a new game is created
    @rolls = []
  end

  def roll(pins) # Pins is the number of pins knocked down in a roll
    # Pushes the roll (number of pins) into the rolls array
    @rolls << pins
  end

  def score
    return @rolls.sum
  end

end
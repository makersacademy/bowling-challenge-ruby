class Frame

  attr_reader :score, :round

  def initialize(number)
    @round = number
    @score = []
  end

  def add_roll(pins)
    score << pins
  end

  def strike?
    score[-1] == (10) 
  end

  def spare?
    score.length == 2 && score.sum == 10
  end

end
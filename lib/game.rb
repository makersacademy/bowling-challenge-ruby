class Game

  def initialize
    @scores = []
  end   

  def roll(pins)
    raise("This is not valid input.") if pins > 10
    @scores << pins
  end

  def score 
    @scores.inject(0, :+)
  end

end
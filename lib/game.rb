class Game

  def initialize
    @scores = []
  end   

  def roll(pins)
    @scores << pins
  end

  def score 
    @scores.inject(0, :+)
  end

end
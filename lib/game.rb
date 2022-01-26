class Game

  MAX_PINS = 10

  def initialize
    @rolls = [] 
  end

  def roll(pins) 
    raise ("This is not valid input.") if pins > MAX_PINS
    @rolls << pins
  end

  def pins_score 
    @rolls.inject(0, :+)
  end

  def spare
  
  end

end
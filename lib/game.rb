class Game
  def initialize
    @rolls = [] 
  end

  def roll(pins)
    @rolls.push(pins)
  end

  def points
    points = @rolls.sum
  end

end
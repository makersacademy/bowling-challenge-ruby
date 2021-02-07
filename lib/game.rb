class Game

  def initialize
    @rolls = []
  end

  def rolls(pins)
    @rolls << pins
  end

  def score
    @rolls.sum
  end

end

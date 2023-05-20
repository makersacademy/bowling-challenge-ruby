class BowlingGame
  attr_reader :rolls

  def initialize
    @rolls = []
  end

  def roll(result)
    @rolls << result
  end
end

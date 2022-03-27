class Game
  def initialize
    @rolls = []
  end

  def roll(pins)
    @rolls << pins
  end

  def score
    total = 0
    turn = 0
    20.times do
      total += @rolls[turn]
      turn += 1
    end
    total
  end
end
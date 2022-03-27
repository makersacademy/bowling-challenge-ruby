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
    10.times do
      if spare?(turn)
        total += @rolls[turn] + @rolls[turn + 1] + @rolls[turn + 2]
      else
        total += @rolls[turn] + @rolls[turn + 1]
      end
      turn += 2
    end
    total
  end

  private

  def spare?(turn)
    @rolls[turn] + @rolls[turn + 1] == 10
  end
end
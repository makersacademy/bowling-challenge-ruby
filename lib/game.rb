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
        total += spare_score(turn)
      else
        total += frame_score(turn)
      end
      turn += 2
    end
    total
  end

  private

  def spare?(turn)
    @rolls[turn] + @rolls[turn + 1] == 10
  end

  def frame_score(turn)
    @rolls[turn] + @rolls[turn + 1]
  end

  def spare_score(turn)
    @rolls[turn] + @rolls[turn + 1] + @rolls[turn + 2]
  end
end
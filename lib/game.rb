class Game
  attr_reader :rolls

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
      if strike?(turn)
        total += bonus_score(turn)
        turn += 1
      elsif spare?(turn)
        total += bonus_score(turn)
        turn += 2
      else
        total += frame_score(turn)
        turn += 2
      end
    end
    total
  end

  private

  def spare?(turn)
    @rolls[turn] + @rolls[turn + 1] == 10
  end

  def strike?(turn)
    @rolls[turn] == 10
  end

  def frame_score(turn)
    @rolls[turn] + @rolls[turn + 1]
  end

  def bonus_score(turn)
    @rolls[turn] + @rolls[turn + 1] + @rolls[turn + 2]
  end
end
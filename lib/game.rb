class Game
  def initialize
    @rolls = []
  end

  def roll(pins)
    raise 'There are only 10 pins' if pins > 10
    @rolls << pins
  end

  def scoreboard
    counter = 0
    round = 0
    10.times do
      if strike(round)
        counter += strike_bonus(round)
        round += 1
      elsif spare(round)
        counter += spare_bonus(round)
        round += 2
      else
        counter += frame_score(round)
        round += 2
      end

    end
    counter
  end

  private

  def frame_score(round)
    @rolls[round].to_i + @rolls[round + 1].to_i
  end

  def strike(round)
    @rolls[round].to_i == 10
  end
  
  def strike_bonus(round)
    10 + @rolls[round + 1].to_i + @rolls[round + 2].to_i
  end

  def spare(round)
    @rolls[round].to_i + @rolls[round + 1].to_i == 10
  end
  
  def spare_bonus(round)
    10 + @rolls[round + 2].to_i
  end

end

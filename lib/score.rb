class Score
  def initialize
    @rolls = []
  end

  def roll(pins)
    @rolls << pins
  end

  def final_score
    score = 0
    round = 0
    for r in 1..10 do
      if strike(round)
        score += strike_bonus(round)
        round += 1
      elsif spare(round)
        score += spare_bonus(round)
        round += 2
      else
        score += frame_score(round)
        round += 2
      end

    end
    score
  end

  private

  def frame_score(round)
    @rolls[round - 1].to_i + @rolls[round].to_i
  end

  def strike(round)
    @rolls[round - 1].to_i == 10
  end

  def strike_bonus(round)
    10 + @rolls[round].to_i + @rolls[round + 1].to_i
  end

  def spare(round)
    @rolls[round - 1].to_i + @rolls[round].to_i == 10
  end

  def spare_bonus(round)
    10 + @rolls[round + 1].to_i
  end

end
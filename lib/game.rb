class Game

  def initialize
    @rolls = []
  end

  def roll(pins)
    @rolls << pins
  end

  def score
    score_total = 0
    roll_count = 0
    10.times do
      if spare?(roll_count)
      score_total += spare_score(roll_count)
      else 
      score_total += frame_score(roll_count)
      end
      roll_count += 2
    end
    score_total
  end

  def spare?(roll_count)
    @rolls[roll_count] + @rolls[roll_count + 1] == 10
  end

  def spare_score(roll_count)
    @rolls[roll_count] + @rolls[roll_count + 1] + @rolls[roll_count + 2]
  end

  def frame_score(roll_count)
    @rolls[roll_count] + @rolls[roll_count + 1]
  end

end
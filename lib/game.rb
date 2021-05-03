class Game

  def initialize
    @rolls = []
  end

  def roll(pins)
    raise "Please enter roll between 1-10" if pins > 10
    @rolls << pins
  end

  def score
    score_total = 0
    roll_count = 0
    10.times do
      if strike?(roll_count)
        score_total += stike_score(roll_count)
        roll_count += 1
      elsif spare?(roll_count)
      score_total += spare_score(roll_count) 
      roll_count += 2
      else 
      score_total += frame_score(roll_count)
      roll_count += 2
      end
    end
    score_total
  end

  private

  def spare?(roll_count)
    @rolls[roll_count] + @rolls[roll_count + 1] == 10
  end

  def strike?(roll_count)
    @rolls[roll_count] == 10
  end

  def stike_score(roll_count)
    @rolls[roll_count] + @rolls[roll_count + 1] + @rolls[roll_count + 2]
  end

  def spare_score(roll_count)
    @rolls[roll_count] + @rolls[roll_count + 1] + @rolls[roll_count + 2]
  end

  def frame_score(roll_count)
    @rolls[roll_count] + @rolls[roll_count + 1]
  end

end
class Scorecard
  def initialize
    @rolls = []
  end

  def roll(pins)
    @rolls << pins
  end

  def score
    total_score = 0
    roll_index = 0

    10.times do
      if strike?(roll_index)
        total_score += 10 + strike_bonus(roll_index)
        roll_index += 1
        p total_score
      elsif spare?(roll_index)
        total_score += 10 + spare_bonus(roll_index)
        roll_index += 2
        p total_score
      else
        total_score += frame_score(roll_index)
        roll_index += 2
        p total_score
      end
    end

    p total_score
  end

  private

  def strike?(roll_index)
    @rolls[roll_index] == 10
  end

  def spare?(roll_index)
    frame_score(roll_index) == 10
  end

  def strike_bonus(roll_index)
    @rolls[roll_index + 1] + @rolls[roll_index + 2]
  end

  def spare_bonus(roll_index)
    @rolls[roll_index + 2]
  end

  def frame_score(roll_index)
    @rolls[roll_index] + @rolls[roll_index + 1]
  end
end
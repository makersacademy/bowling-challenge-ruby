class Bowling
  def initialize
    @rolls = []
  end

  def roll(pins)
    @rolls << pins
  end

  def score
    total_score = 0
    roll_index = 0

    (1..10).each do |_|
      if strike?(roll_index)
        total_score += 10 + strike_bonus(roll_index)
        roll_index += 1
      elsif spare?(roll_index)
        total_score += 10 + spare_bonus(roll_index)
        roll_index += 2
      else
        total_score += frame_score(roll_index)
        roll_index += 2
      end
    end

    total_score
  end

  private

  def strike?(roll_index)
    @rolls[roll_index].to_i == 10
  end

  def spare?(roll_index)
    @rolls[roll_index].to_i + @rolls[roll_index + 1].to_i == 10
  end

  def strike_bonus(roll_index)
    if roll_index == 18
      @rolls[roll_index + 1].to_i + @rolls[roll_index + 2].to_i
    else
      @rolls[roll_index + 1].to_i + (@rolls[roll_index + 2].to_i || 0)
    end
  end

  def spare_bonus(roll_index)
    @rolls[roll_index + 2].to_i
  end

  def frame_score(roll_index)
    @rolls[roll_index].to_i + @rolls[roll_index + 1].to_i
  end
end
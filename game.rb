class Game

  attr_reader :rolls

  def initialize
    @rolls = []
  end

  def roll(num_pins)
    @rolls << num_pins
  end

  def scorecard
    result = 0
    roll_count = 0
    10.times do
      if strike?(roll_count)
        result += strike_bonus(roll_count)
        roll_count += 1
      elsif spare?(roll_count)
        result += spare_bonus(roll_count)
        roll_count += 2
      else
        result += normal_score(roll_count)
        roll_count += 2
      end
    end
    result
  end

  def strike?(roll_count)
    @rolls[roll_count] == 10
  end

  def strike_bonus(roll_count)
    strike = 10
    strike + @rolls[roll_count + 1] + @rolls[roll_count + 2]
  end

  def spare?(roll_count)
    @rolls[roll_count] + @rolls[roll_count + 1] == 10
  end

  def spare_bonus(roll_count)
    spare = 10
    spare + @rolls[roll_count + 2]
  end

  def normal_score(roll_count)
    @rolls[roll_count] + @rolls[roll_count + 1]
  end
end

class Bowling_scorecard
  attr_reader :roll

  def initialize
    @roll = []
  end

  def roll(pins)
    @roll << pins
  end

  def score
    total = 0
    roll_throw = 0

    for i in 1..10 do
      if strike(roll_throw)
        total += strike_bonus(roll_throw)
        roll_throw += 1
      elsif spare(roll_throw)
        total += spare_bonus(roll_throw)
        roll_throw += 2
      else
        total += sum_of_rolls(roll_throw)
        roll_throw += 2
      end
    end
    total
  end

  private

  def sum_of_rolls(roll_throw)
    @roll[roll_throw - 1].to_i + @roll[roll_throw].to_i
  end

  def strike(roll_throw)
    @roll[roll_throw - 1].to_i ==10
  end

  def strike_bonus(roll_throw)
    10 + @roll[roll_throw].to_i + @roll[roll_throw + 1].to_i
  end

  def spare(roll_throw)
    @roll[roll_throw - 1].to_i + @roll[roll_throw].to_i == 10
  end

  def spare_bonus(roll_throw)
    10 + @roll[roll_throw + 1].to_i
  end
end
class BowlingScore 
  FRAMES = 10

  def initialize
    @rolls = []
  end

  def roll(score)
    @rolls << score
  end

  def total_score
    total = 0
    roll_number = 0
    FRAMES.times do
      if strike?(roll_number)
        total += strike_score(roll_number)
        roll_number += 1
      elsif spare?(roll_number)
        total += spare_score(roll_number)
        roll_number += 2
      else
        total += regular_score(roll_number)
        roll_number += 2
      end
    end
    total
  end

  def regular_score(roll_number)
    @rolls[roll_number] + @rolls[roll_number + 1]
  end

  def strike?(roll_number)
    @rolls[roll_number] == 10
  end

  def strike_score(roll_number)
    10 + @rolls[roll_number + 1] + @rolls[roll_number + 2]
  end

  def spare?(roll_number)
    @rolls[roll_number] + @rolls[roll_number + 1] == 10
  end

  def spare_score(roll_number)
    10 + @rolls[roll_number + 2]
  end
end

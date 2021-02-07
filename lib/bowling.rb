class Bowling
  attr_reader :score

  def initialize
    @rolls = []
  end

  def hit(pins)
    @rolls.push(pins)
  end
  
  def score
    result = 0
    roll_counter = 0
    10.times do
      if spare?(roll_counter)
        result += spare_score(roll_counter)
      else
      result += @rolls[roll_counter] + @rolls[roll_counter + 1]
      end
      roll_counter += 2
    end
    result
  end

  private 

  def strike
    "STRIKE!"
  end

  def spare?(roll_counter)
    @rolls[roll_counter] + @rolls[roll_counter + 1] == 10
  end

  def spare_score(roll_counter)
    @rolls[roll_counter] + @rolls[roll_counter + 1] + @rolls[roll_counter + 2]
  end

  def gutter
    "GUTTER!"
  end

end
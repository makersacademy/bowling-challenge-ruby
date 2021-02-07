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
        roll_counter += 2
      elsif strike?(roll_counter)
        result += strike_score(roll_counter)
        roll_counter += 1
      else
      result += reg_score(roll_counter)
      roll_counter += 2
      end
    end
    result
  end

  private 

  def spare?(roll_counter)
    @rolls[roll_counter] + @rolls[roll_counter + 1] == 10
  end

  def spare_score(roll_counter)
    10 + @rolls[roll_counter + 2]
  end

  def strike?(roll_counter)
    @rolls[roll_counter] == 10
  end

  def strike_score(roll_counter)
    10 + @rolls[roll_counter + 1] + @rolls[roll_counter + 2]
  end

  def reg_score(roll_counter)
    @rolls[roll_counter] + @rolls[roll_counter + 1]
  end

end
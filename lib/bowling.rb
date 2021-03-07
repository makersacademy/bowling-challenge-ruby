class Bowling

  def initialize
    @rolls = []
  end
  def roll(pins)
    @rolls << pins
  end
  def total_score
    total = 0
    roll_number = 0
    10.times do 
      if strike?(roll_number)
        total += strike_score(roll_number)
        roll_number +=1
      elsif spare?(roll_number)
        total += spare_score(roll_number)
        roll_number +=2
      else
        total += regular_score(roll_number)
        roll_number +=2
      end
    end
    total
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
    p roll_number
   10 + @rolls[roll_number + 2]
  end 

  def regular_score(roll_number)
    @rolls[roll_number] + @rolls[roll_number + 1]
  end



end
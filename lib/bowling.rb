class Bowling
  def initialize
    @rolls = []
  end
  
  def roll(pins)
    raise 'You must enter a score less than 10' if pins > 10
    @rolls << pins
  end

  def score
    current_roll = 0
    total = 0
    10.times do 
      if strike?(current_roll)
        total += strike_bonus(current_roll)
        current_roll += 1
      elsif spare?(current_roll)
        total += spare_bonus(current_roll)
        current_roll += 2
      else
        total += sum_of_frame_rolls(current_roll)
        current_roll += 2
      end
    end
    total
  end
  
  def spare_bonus(current_roll)
    @rolls[current_roll + 2] + 10
  end
  
  def strike_bonus(current_roll)
    @rolls[current_roll + 1] + @rolls[current_roll + 2] + 10
  end
  
  def spare?(current_roll)
    @rolls[current_roll] + @rolls[current_roll + 1] == 10
  end
  
  def strike?(current_roll)
    @rolls[current_roll] == 10
  end
  
  def sum_of_frame_rolls(current_roll)
    @rolls[current_roll] + @rolls[current_roll + 1]
  end
end

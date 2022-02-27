class Bowling
  
  def initialize
    @rolls = []
  end

  def rollball(pins)
    @rolls << pins
  end

  def score
    result = 0
    number_of_roll = 0
    10.times do
      if strike?(number_of_roll)
        result += strike_score(number_of_roll)
        number_of_roll += 1
      elsif spare?(number_of_roll)
        result += spare_score(number_of_roll)
        number_of_roll += 2
      else
        result += frame_score(number_of_roll)
        number_of_roll += 2
      end
    end
    result
  end

  def strike?(number_of_roll)
    @rolls[number_of_roll] == 10
  end

  def strike_score(number_of_roll)
    @rolls[number_of_roll] + @rolls[number_of_roll + 1] + @rolls[number_of_roll + 2]
  end
  
  def spare?(number_of_roll)
    @rolls[number_of_roll] + @rolls[number_of_roll + 1] == 10
  end

  def spare_score(number_of_roll)
    @rolls[number_of_roll] + @rolls[number_of_roll + 1] + @rolls[number_of_roll + 2]
  end

  def frame_score(number_of_roll)
    @rolls[number_of_roll] + @rolls[number_of_roll + 1]
  end

end
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
      if spare?(number_of_roll)
        result += spare_score(number_of_roll)
      else
        result += frame_score(number_of_roll)
      end
      number_of_roll += 2
    end
    result
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
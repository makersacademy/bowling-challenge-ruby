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
      if @rolls[number_of_roll] + @rolls[number_of_roll + 1] == 10
        result += @rolls[number_of_roll] + @rolls[number_of_roll + 1] + @rolls[number_of_roll + 2]
      else
        result += @rolls[number_of_roll] + @rolls[number_of_roll + 1]
      end
      number_of_roll += 2
    end
    result
  end

end
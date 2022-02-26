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
    20.times{
      result += @rolls[number_of_roll]
      number_of_roll +=1
  }
    result
  end

end
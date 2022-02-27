class BowlingScore

  def initialize
    @rolls = []
  end

  def play(pins)
    @rolls << pins
  end

  def score
    result = 0
    number_of_goes = 0
    10.times do
      if spare?(number_of_goes)
        result += spare_score(number_of_goes)
        number_of_goes += 2
      elsif strike?(number_of_goes)
        result += strike_score(number_of_goes)
        number_of_goes += 1
      else
        result += frame_score(number_of_goes)
        number_of_goes += 2
      end
    end
    result
  end

  def strike?(number_of_goes)
    @rolls[number_of_goes] == 10
  end

  def strike_score(number_of_goes)
    @rolls[number_of_goes] + @rolls[number_of_goes + 1] + @rolls[number_of_goes + 2]
  end
  
  def spare?(number_of_goes)
    @rolls[number_of_goes] + @rolls[number_of_goes + 1] == 10
  end

  def spare_score(number_of_goes)
    @rolls[number_of_goes] + @rolls[number_of_goes + 1] + @rolls[number_of_goes + 2]
  end

  def frame_score(number_of_goes)
    @rolls[number_of_goes] + @rolls[number_of_goes + 1]
  end

end
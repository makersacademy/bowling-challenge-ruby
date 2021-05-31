

class Scorecard

  attr_reader :score

  def initialize
    @score = []
  end

  def bowl(pins)
    @score << pins
  end

  def score
    result = 0
    @bowl_index = 0
    10.times do
      if strike?
        result += @score[@bowl_index] + @score[@bowl_index + 1] +
               @score[@bowl_index + 2] 
        @bowl_index += 1 
      elsif spare?
        result += @score[@bowl_index] + @score[@bowl_index + 1] +
                  @score[@bowl_index + 2]
        @bowl_index += 2 
      else 
        result += @score[@bowl_index] + @score[@bowl_index + 1]    
        @bowl_index += 2 
      end
    end
    result 
  end

  def spare?
    @score[@bowl_index] + @score[@bowl_index + 1] == 10
  end

  def strike?
    @score[@bowl_index] == 10
  end

end
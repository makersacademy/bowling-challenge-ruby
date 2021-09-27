class Bowling_scorecard

  def initialize
    @rolls = []
    @i = 0
    @result = 0 
  end 

  def roll(pins)
    @rolls.push(pins)
  end

  def score 
    10.times do 
      if strike 
        @result += strike_score
      elsif spere 
        @result += spere_score
      else 
        @result += frame_score
      end
    increment
    end 
    @result
  end 

private 
  def increment
    if strike 
      @i += 1
    else
      @i += 2
    end
  end

  def spere
    @rolls[@i] + @rolls[@i + 1] == 10
  end

  def spere_score
    @rolls[@i] + @rolls[@i + 1] + @rolls[@i + 2]
  end 
  
  def strike
    @rolls[@i] == 10 
  end

  def strike_score
    10 + @rolls[@i + 1] + @rolls[@i + 2]
  end

  def frame_score 
    @rolls[@i] + @rolls[@i + 1]
  end

end

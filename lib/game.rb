class Game

  def initialize(score)
    @scorecard = score
    @bonus = 0
  end

  def calculate
    calculate_spare
    calculate_strike
    @bonus + @scorecard.inject(0, :+)
  end

  def calculate_strike
    @scorecard.each_index do |score|
      if (@scorecard[score] == 10)
        break if @scorecard[score + 3].nil?
        @bonus += @scorecard[score + 1] + @scorecard[score + 2]
      end
    end
  end

  def calculate_spare
    @spare_score = @scorecard
    spare = false
    @spare_score.each_slice(2).with_index { |(a, b), i| 

    if spare
      @bonus += a
      spare = false
    end
      
    if a != nil && b !=nil
      if a + b == 10
      spare = true
      end
    end
    }
  end

end
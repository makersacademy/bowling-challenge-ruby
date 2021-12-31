class BowlingGame
  attr_reader :scorecard

  def initialize(scorecard = [])
    @scorecard = scorecard
  end

  def score
    score = 0
    @scorecard.each_with_index do |frame,index|
      if strike?(frame)
       score += frame.sum + @scorecard[index + 1].sum
      elsif spare?(frame)
       score += frame.sum + @scorecard[index + 1].first
      else
       score += frame.sum
      end
    end
    score
  end

  def strike?(frame)
    frame.any? { |n| n == 10 }
  end

  def spare?(frame)
    frame.sum == 10
  end

end
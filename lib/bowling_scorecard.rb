class BowlingScorecard
  attr_reader :current_score

  def initialize
    @current_score = 0
  end

  def enter_roll(score)
    return "Invalid score entered, entered_score must be between 0 and 10." unless valid_score?(score)
    
    @current_score += score
  end

private

  def valid_score?(score)
    if score > 10 || score < 0
      false
    else
      true
    end
  end
end

class BowlingScore
  attr_reader :user_rolls

  def initialize(user_rolls)
    @user_rolls = user_rolls
  end

  def scores
    @user_rolls.map do |frame| 
      if frame[0] != 10
        frame.sum == 10 ? "spare" : frame.sum 
      else
        "strike"
      end
    end
  end

  def total_score
    @user_rolls.flatten.sum
  end
end
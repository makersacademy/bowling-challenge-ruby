class BowlingScore
  attr_reader :user_rolls

  def initialize(user_rolls)
    @user_rolls = user_rolls
  end

  def scores
    @user_rolls.map { |frame| frame.sum }
  end

  def total_score
    @user_rolls.flatten.sum
  end
end
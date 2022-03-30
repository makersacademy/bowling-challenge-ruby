class BowlingScore
  attr_reader :user_rolls

  def initialize(user_rolls)
    @user_rolls = user_rolls
  end

  def scores
    @user_rolls.map.with_index do |frame, ind| 
      if frame[0] != 10
        frame.sum == 10 ? frame.sum + @user_rolls[ind + 1][0] : frame.sum
      else
        if @user_rolls[ind + 1][0] == 10
          frame[0] + @user_rolls[ind + 1][0] + @user_rolls[ind + 2][0]
        else
          frame[0] + @user_rolls[ind + 1].sum
        end
      end
    end
  end

  def total_score
    scores.sum
  end
end
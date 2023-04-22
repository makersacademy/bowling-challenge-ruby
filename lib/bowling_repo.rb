class Scorecard
  def initialize 
    @total_score = 0
    @frame = 1
  end

  def add_score(roll_one, roll_two, roll_three = 0)
    if @frame < 10
      @total_score += roll_one + roll_two + roll_three
    end
  end

  def total_score
    return final_score_comment
  end

  def final_score_comment
    if @total_score == 300
      return "Perfect score!"
    elsif @total_score == 0
      return "Gutter Ball!"
    else
      return "Final score is: #{@total_score}"
    end
  end
end

class BowlingScorecard
  def enter_roll(score)
    score_validator(score)
  end

  private

  def score_validator(score)
    if score > 10 || score < 0
      "Invalid score entered, entered_score must be between 0 and 10."
    else
      score
    end
  end
end

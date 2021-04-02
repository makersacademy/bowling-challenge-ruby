class BowlingScorecard
  def enter_roll(score)
    if score > 10
      "Invalid score entered, entered_score must be between 0 and 10."
    else
      score
    end
  end
end

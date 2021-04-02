class BowlingScorecard
  attr_reader :current_score

  def initialize
    @current_score = 0
  end

  def enter_roll(score)
    return "Invalid score entered, entered_score must be between 0 and 10." unless valid_score?(score)

    @current_score += score
  end

  def display_scorecard
    [{ round: 1, first_roll: 5, second_roll: 4 , roll_score: 9, strike: false, spare: false, bonus_points: 0, frame_score: 9, total_score: 9 }]
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

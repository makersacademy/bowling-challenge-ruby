class Scorecard
  attr_reader :current_roll
  def input_score(score)
    @current_roll = score.score
  end
end
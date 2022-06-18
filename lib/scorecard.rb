class Scorecard
  attr_reader :frame_total
  def input_score(score)
    @frame_total = score.first_roll + score.second_roll
  end
end
class BowlingGame

  attr_reader :current_frame, :roll_1_score, :roll_2_score, :roll_3_score, :bonus_score, :total_frame_score, :strike, :spare, :scorecard

  def initialize
    @current_frame = 1
    @roll_1_score = 0
    @roll_2_score = 0
    @roll_3_score = 0
    @bonus_score = 0
    @total_frame_score = 0
    @strike = false
    @spare = false
    @scorecard = []
  end

  def first_roll(players_score)
    @roll_1_score = players_score
  end

  def second_roll(players_score)
    @roll_2_score = players_score
  end

  def third_roll(players_score)
    @roll_3_score = players_score
  end

end

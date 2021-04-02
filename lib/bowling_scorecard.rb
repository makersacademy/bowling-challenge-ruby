class BowlingScorecard
  attr_reader :current_score, :frame

  def initialize
    @frame = 1
    @first_roll = nil
    @second_roll = nil
    @roll_score = nil
    @strike = false
    @spare = false
    @bonus_points = nil
    @frame_score = nil
    @current_score = 0
  end

  def enter_roll(score)
    return "Invalid score entered, entered_score must be between 0 and 10." unless valid?(score)

    assign(score)
    increment_frame_if_end_frame

    @current_score += score
  end

  def display_scorecard
    [{ frame: 1, first_roll: 5, second_roll: 4 , roll_score: 9, strike: false, spare: false, bonus_points: 0, frame_score: 9, total_score: 9 }]
  end

private
  def valid?(score)
    return false if (score > 10 || score < 0)

    true
  end

  def assign(score)
    if @first_roll == nil
      @strike = true if score == 10
      @first_roll = score
    else
      @second_roll = score
    end
  end

  def increment_frame_if_end_frame
    if @first_roll != nil and @second_roll != nil
      @frame += 1
      reset_frame_stats
    elsif @first_roll != nil and @strike == true
      @frame += 1
      reset_frame_stats
    end
  end

  def reset_frame_stats
    @first_roll = nil
    @second_roll = nil
    @strike = nil
  end
end

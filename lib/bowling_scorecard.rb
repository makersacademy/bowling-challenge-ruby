class BowlingScorecard
  attr_reader :current_score, :frame

  def initialize
    @frame = 1
    @first_roll = nil
    @second_roll = nil
    @roll_score = nil
    @strike = false
    @spare = false
    @frame_score = 0
    @current_score = 0
    @score_log = []
  end

  def enter_roll(score)
    invalid_message = "Invalid score entered, score must be between 0 and #{10 - @frame_score}."
    return invalid_message unless valid?(score)

    assign(score)
    update_current_and_frame(score)
    bonus_points_applicable?(score)
    update_score_log
    increment_frame_if_end_frame

    score
  end

  def generate_scorecard_info
    @score_log
  end

private
  def valid?(score)
    return false if score > (10 - @frame_score)
    return false if score.negative?

    true
  end

  def assign(score)
    if @first_roll.nil?
      @strike = true if score == 10
      @first_roll = score
    else
      @spare = true if (@first_roll + score) == 10
      @second_roll = score
    end
  end

  def update_current_and_frame(score)
    @frame_score += score
    @current_score += score
  end

  def bonus_points_applicable?(score)
    return unless @frame > 1

    if @score_log[@frame - 2][:strike]
      apply_bonus_points(@frame - 2, score)
      apply_bonus_if_two_strikes_in_row(@frame - 3, score)
    elsif @score_log[@frame - 2][:spare] and @second_roll.nil?
      apply_bonus_points(@frame - 2, score)
    end
  end

  def apply_bonus_if_two_strikes_in_row(frame, score)
    two_strikes_in_row_test = (@score_log[frame][:strike] and @second_roll.nil? and @frame > 2)
    apply_bonus_points(frame, score) if two_strikes_in_row_test
  end

  def apply_bonus_points(frame, score)
    @score_log[frame][:bonus_points] += score
    @score_log[frame][:frame_score] += score
    @score_log[frame][:total_score] += score
    @current_score += score
  end

  def update_score_log
    if @score_log.length < @frame
      @score_log << current_frame_information
    else
      @score_log[@frame - 1] = current_frame_information
    end
  end

  def current_frame_information
    {
      frame: @frame,
      first_roll: @first_roll,
      second_roll: @second_roll,
      strike: @strike,
      spare: @spare,
      bonus_points: 0,
      frame_score: @frame_score,
      total_score: @current_score
    }
  end

  def increment_frame_if_end_frame
    return if @frame == 10

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
    @strike = false
    @spare = false
    @frame_score = 0
  end
end

class BowlingScorecard
  attr_reader :current_score, :frame

  def initialize
    @frame = 1
    @first_roll = nil
    @second_roll = nil
    @roll_score = nil
    @strike = false
    @spare = false
    @bonus_points = 0
    @frame_score = 0
    @current_score = 0
    @score_log = []
  end

  def enter_roll(score)
    invalid_message = "Invalid score entered, score must be between 0 and #{max_score}."
    return invalid_message unless valid?(score)

    assign(score)
    update_current_and_frame(score)
    bonus_points_applicable?(score) unless (@frame == 10 and @third_roll != nil)
    tenth_frame_bonus_points(score)
    update_score_log
    increment_frame_if_end_frame # not needed for 10
    return score unless end_game_condition

    "end game"
  end

  def generate_scorecard_info
    @score_log
  end

private
  def valid?(score)
    return false if score > max_score
    return false if score.negative?

    true
  end

  def max_score
    return 10 if @frame == 10 and (@strike or @spare)

    10 - @frame_score
  end

  def assign(score)
    if @first_roll.nil?
      first_roll_assignments(score)
    elsif @first_roll != nil and @second_roll.nil?
      second_roll_assignments(score)
    else
      @third_roll = score
    end
  end

  def first_roll_assignments(score)
    @third_roll = nil if @frame == 10
    @strike = true if score == 10
    @first_roll = score
  end

  def second_roll_assignments(score)
    @spare = true if (@first_roll + score) == 10
    @second_roll = score
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

  def apply_bonus_if_two_strikes_in_row(frame_index, score)
    two_strikes_in_row = (@score_log[frame_index][:strike] and @second_roll.nil? and @frame > 2)
    return unless two_strikes_in_row

    apply_bonus_points(frame_index, score)
    @score_log[frame_index + 1][:total_score] += score
  end

  def apply_bonus_points(frame_index, score)
    @score_log[frame_index][:bonus_points] += score
    @score_log[frame_index][:frame_score] += score
    @score_log[frame_index][:total_score] += score
    @current_score += score
  end

  def tenth_frame_bonus_points(score)
    return unless @frame == 10

    @bonus_points += score if @strike and @second_roll != nil
    @bonus_points += score if @spare and @third_roll != nil
  end

  def update_score_log
    if @score_log.length < @frame
      @score_log << current_frame_information
    else
      @score_log[@frame - 1] = current_frame_information
    end

    @score_log[9][:third_roll] = @third_roll if @frame == 10
  end

  def current_frame_information
    {
      frame: @frame,
      first_roll: @first_roll,
      second_roll: @second_roll,
      strike: @strike,
      spare: @spare,
      bonus_points: @bonus_points,
      frame_score: @frame_score,
      total_score: @current_score,
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

  def end_game_condition
    return false unless @frame == 10
    return true if @third_roll != nil
    return true unless third_roll?

    false
  end

  def third_roll?
    @first_roll != nil and @second_roll != nil and (!@spare or !@strike)
  end
end

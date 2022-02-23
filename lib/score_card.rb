require_relative 'frame'
require_relative 'bonus_log'

class ScoreCard
  attr_reader :frame, :bonus_log

  def initialize(frame: Frame, bonus_log: BonusLog.new)
    @roll_no = 0
    @frame = frame
    @bonus_log = bonus_log
  end

  def enter_pins(no_pins)
    @current_pins = no_pins
    return 'Invalid Entry' unless @frame.accept_roll?(no_pins)
    progress_game
    return game_over if end_game?
    calculate_score
  end

  def progress_game
    @roll_no += 1
    @frame.fallen_pins(@current_pins)
    add_to_bonus_log
    @frame.add_bonuses(frames_to_add_bonus, @current_pins) if frames_to_add_bonus
  end

  def add_to_bonus_log
    @bonus_log.log_strike_bonus(@roll_no, @frame.no) if @frame.strike?
    @bonus_log.log_spare_bonus(@roll_no, @frame.no) if @frame.spare?
  end

  def frames_to_add_bonus
    @bonus_log.check_for_frames(@roll_no)
  end

  def calculate_score
    @frame.frame_totals.sum
  end

  def end_game?
    @frame.no10_complete?
  end

  def game_over
    "You scored #{calculate_score}. Conratulations!"
  end
end

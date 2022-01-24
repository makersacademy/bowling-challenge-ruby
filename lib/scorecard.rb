require_relative 'frame'
require_relative 'bonus_log'

class ScoreCard
  def initialize(frame: Frame, bonus_log: BonusLog)
    @frame = frame
    @bonus_log = bonus_log
  end

  def enter_pins(no_pins)
    return 'Invalid Entry' unless valid_entry?(no_pins)

    @frame.fallen_pins(no_pins)
  end

  def valid_entry?(no_pins)
    no_pins <= 10
  end

  def add_to_bonus_log
    @bonus_log.log_strike_bonus(@roll_no, @frame.no) if @frame.current_is_a_strike?
    @bonus_log.log_spare_bonus(@roll_no, @frame.no) if @frame.current_is_a_spare?
  end
end

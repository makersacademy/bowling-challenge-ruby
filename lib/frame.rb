# frozen_string_literal: true

class Frame
  TEN_PINS = 10
  FIRST_ROLL = 1
  SECOND_ROLL = 2
  LAST_ROLL = 3

  def initialize
    @rolls = {}
    @frame_type = nil
  end

  def log_roll(pins_downed)
    raise 'Pins downed must be between 0 and 10' if invalid_pins?(pins_downed)

    process_roll(pins_downed)
  end

  def roll_score(roll)
    @rolls[roll]
  end

  def frame_complete?
    @rolls.count > 1 || @frame_type == :strike
  end

  def strike_frame?
    @frame_type == :strike
  end

  def spare_frame?
    @frame_type == :spare
  end

  private

  def invalid_pins?(pins_downed)
    pins_downed.negative? || pins_downed > TEN_PINS
  end

  def to_many_pins?(pins_downed)
    return false if @frame_type == :strike
    pins_downed > pins_left
  end

  def pins_left
    return TEN_PINS - @rolls[FIRST_ROLL]
  end

  def process_roll(pins_downed)
    process_frame_type(pins_downed)
    process_final_roll(pins_downed)
    process_second_roll(pins_downed)
    process_first_roll(pins_downed)
  end

  def process_first_roll(pins_downed)
    return unless first_roll?

    @rolls[FIRST_ROLL] = pins_downed
  end

  def process_second_roll(pins_downed)
    return unless second_roll?
    raise "Pins downed must be between 0 and #{pins_left}" if to_many_pins?(pins_downed)
    @rolls[SECOND_ROLL] = pins_downed
  end

  def process_final_roll(pins_downed)
    return unless last_roll?

    @rolls[LAST_ROLL] = pins_downed
  end

  def process_frame_type(pins_downed)
    return unless @frame_type.nil?

    @frame_type = :strike if pins_downed == TEN_PINS && first_roll?
    @frame_type = :spare if second_roll? && pins_downed + @rolls[FIRST_ROLL] == TEN_PINS
    @frame_type = :open_frame if second_roll? && pins_downed + @rolls[FIRST_ROLL] != TEN_PINS
  end

  def last_roll?
    return false if second_roll?
    return false if first_roll?

    @rolls[LAST_ROLL].nil?
  end

  def second_roll?
    return false if first_roll?

    @rolls[SECOND_ROLL].nil?
  end

  def first_roll?
    @rolls.empty?
  end
end

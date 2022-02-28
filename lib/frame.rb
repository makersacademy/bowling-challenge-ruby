# frozen_string_literal: true

class Frame
  TEN_PINS = 10
  FIRST_ROLL = 0
  SECOND_ROLL = 1

  def initialize
    @rolls = []
    @frame_type = nil
  end

  def log_roll(pins_downed)
    raise 'Pins downed must be between 0 and 10' if invalid_pins?(pins_downed)
    raise 'Frame complete. Cannot roll again' if frame_complete?

    process_frame_type(pins_downed)
    process_roll(pins_downed)
  end

  def sum_frame
    @rolls.sum
  end

  def all_rolls
    @rolls
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

  def open_frame?
    @frame_type == :open
  end

  private

  def invalid_roll?(roll)
    roll.negative? || (roll > @rolls.count)
  end

  def invalid_pins?(pins_downed)
    pins_downed.negative? || pins_downed > TEN_PINS
  end

  def to_many_pins?(pins_downed)
    return false if @frame_type == :strike

    pins_downed > pins_left
  end

  def pins_left
    TEN_PINS - @rolls[FIRST_ROLL]
  end

  def process_roll(pins_downed)
    process_second_roll(pins_downed)
    process_first_roll(pins_downed)
  end

  def process_second_roll(pins_downed)
    return unless second_roll?
    raise "Pins downed must be between 0 and #{pins_left}" if to_many_pins?(pins_downed)

    @rolls << pins_downed
  end

  def process_first_roll(pins_downed)
    return unless first_roll?

    @rolls << pins_downed
  end

  def process_frame_type(pins_downed)
    return unless @frame_type.nil?

    @frame_type = :strike if pins_downed == TEN_PINS && first_roll?
    @frame_type = :spare if second_roll? && pins_downed + @rolls[FIRST_ROLL] == TEN_PINS
    @frame_type = :open if second_roll? && pins_downed + @rolls[FIRST_ROLL] != TEN_PINS
  end

  def second_roll?
    return false if first_roll?

    @rolls[SECOND_ROLL].nil?
  end

  def first_roll?
    @rolls.empty?
  end
end

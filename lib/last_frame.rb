# frozen_string_literal: true

require './lib/frame'

class LastFrame < Frame
  def frame_complete?
    return @rolls.count == 3 if bonus_frame?

    super
  end

  def log_roll(pins_downed)
    raise 'Pins downed must be between 0 and 10' if invalid_pins?(pins_downed)
    raise 'Frame complete. Cannot roll again' if frame_complete?

    process_frame_type(pins_downed)
    process_roll(pins_downed)
  end

  private

  def process_roll(pins_downed)
    process_final_roll(pins_downed)
    super
  end

  def last_roll?
    return false if second_roll?
    return false if first_roll?

    @rolls[LAST_ROLL].nil?
  end

  def bonus_frame?
    strike_frame? || spare_frame?
  end

  def process_final_roll(pins_downed)
    return unless last_roll?

    @rolls << pins_downed
  end
end

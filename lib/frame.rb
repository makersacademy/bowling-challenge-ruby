# frozen_string_literal: true

require_relative 'roll'

# Frame class
class Frame
  attr_reader :frame

  def initialize(roll_class = Roll)
    @roll_class = roll_class
    @frame = []
  end

  def roll(pins)
    raise IncorrectRollError, frame_over if frame_finished?
    raise IncorrectRollError, no_pins_left if too_many?(pins)

    @frame << @roll_class.new(pins)
    @frame << 0 if frame_ongoing? && pins == max_pins
    # pins
  end

  private

  def max_pins
    Roll::MAX_PINS
  end

  def frame_ongoing?
    @frame.length == 1
  end

  def frame_finished?
    @frame.length == 2
  end

  def too_many?(pins)
    !@frame.empty? && pins > (max_pins - @frame.last.pins)
  end

  def frame_over
    'Frame has reached the maximum amount of rolls'
  end

  def no_pins_left
    'Number of pins entered exceeds the amount of pins left'
  end
end

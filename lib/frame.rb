# frozen_string_literal: true

require_relative 'roll'

MAX_PINS = 10

# Frame class
class Frame
  attr_reader :score, :max_pins

  def initialize(roll_class = Roll)
    @roll_class = roll_class
    @score = []
  end

  def roll(pins)
    raise IncorrectRollError, frame_over if frame_finished?
    raise IncorrectRollError, no_pins_left if too_many?(pins)

    @score << @roll_class.new(pins).pins
    @score << 0 if frame_ongoing? && pins == MAX_PINS
    # pins
  end

  private

  def frame_ongoing?
    @score.length == 1
  end

  def frame_finished?
    @score.length == 2
  end

  def too_many?(pins)
    !@score.empty? && pins > (MAX_PINS - @score.last)
  end

  def frame_over
    'Frame has reached the maximum amount of rolls'
  end

  def no_pins_left
    'Number of pins entered exceeds the amount of pins left'
  end
end

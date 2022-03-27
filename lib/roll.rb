# frozen_string_literal: true

require_relative 'incorrect_roll_error'

# Roll class
class Roll
  attr_reader :pins

  MAX_PINS = 10

  def initialize(pins)
    raise IncorrectRollError, negative_pins_error if pins.negative?
    raise IncorrectRollError, max_pins_error if pins > MAX_PINS

    @pins = pins
  end

  private

  def negative_pins_error
    'Cannot roll negative amount of pins'
  end

  def max_pins_error
    'Cannot roll more than a maximum amount of pins'
  end
end

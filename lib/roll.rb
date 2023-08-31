# frozen_string_literal: true

class Roll
  attr_reader :knocked_pins

  def initialize(pins_left)
    @pins_left = pins_left
    @knocked_pins = nil
  end

  def knock(pins)
    raise 'not enough pins left' if pins > @pins_left

    @knocked_pins = pins
  end
end

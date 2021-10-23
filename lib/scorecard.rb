# frozen_string_literal: true

class Scorecard
  attr_reader :pins_knocked_down

  def initialize
    @pins_knocked_down =
      [
        [0, 0],
        [0, 0],
        [0, 0],
        [0, 0],
        [0, 0],
        [0, 0],
        [0, 0],
        [0, 0],
        [0, 0],
        [0, 0, 0]
      ]
  end

  def record_pins(pins, frame, bowl)
    @pins_knocked_down[frame - 1][bowl - 1] = pins
  end
end

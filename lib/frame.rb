require_relative './score'

class Frame

 attr_reader :knocked_down_pins_log, :frame

  def initialize(score = Score.new)
    @knocked_down_pins_log = []
    @frame = 0
  end

  def knocked_down_pins(num)
    @knocked_down_pins_log.push(num)
  end

  def reset_knocked_down_pins_log
    @knocked_down_pin_log = []
    change_frame
  end

  def change_frame
    @frame += 1
  end
end

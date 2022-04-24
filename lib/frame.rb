class Frame

 attr_reader :knocked_down_pins_log

  def initialize
    @knocked_down_pins_log = []
  end

  def knocked_down_pins(num)
    @knocked_down_pins_log.push(num)
  end

  def reset_knocked_down_pins_log
    @knocked_down_pin_log = []
  end
  

end
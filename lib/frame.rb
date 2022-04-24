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

  def spare?
    if @knocked_down_pins_log.sum == 10 && @knocked_down_pins_log.length == 2
      true
    else false
    end
  end

  def strike?
    if @knocked_down_pins_log.sum == 10 && @knocked_down_pins_log.length == 1
      true
    else false
    end
  end
end

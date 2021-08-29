require_relative 'validity'

class Roll

  ROLL_MIN = 0
  MIN_REMAIN_PINS = 1
  ROLL_MAX = 10

  def roll(pins, remaining_pins = ROLL_MAX, check = Validity.new)
    remaining_pin_check(remaining_pins, check)
    valid_roll_check(pins, remaining_pins, check)
    pins
  end
  
private

  def remaining_pin_check(remaining_pins, check)
    message = "Remaining pins must be between #{MIN_REMAIN_PINS}-#{ROLL_MAX}"
    raise message unless check.valid?(remaining_pins, MIN_REMAIN_PINS, ROLL_MAX) 
  end

  def valid_roll_check(pins, remaining_pins, check)
    message = 'Not a valid roll'
    raise message unless check.valid?(pins, ROLL_MIN, remaining_pins)
  end

end

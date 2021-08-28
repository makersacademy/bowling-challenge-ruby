require_relative 'validity'

class Roll

  ROLL_MIN = 0
  ROLL_MAX = 10

  def roll(pins, check = Validity.new)
    raise 'Not a valid roll' unless check.valid?(pins, ROLL_MIN, ROLL_MAX)
    
    pins
  end

end

class Roll

  ROLL_MIN = 0
  ROLL_MAX = 10

  def roll(pins)
    raise 'Not a valid roll' if invalid?(pins, ROLL_MIN, ROLL_MAX)
    
    pins
  end

  private

  def invalid?(number, min, max)
    return true unless number.is_a? Integer

    number < ROLL_MIN || number > ROLL_MAX
  end

end

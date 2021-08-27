class Roll

  def roll(pins)
    raise 'Not a valid roll' if invalid?(pins)
  end

  private

  def invalid?(pins)
    return true unless pins.is_a? Integer

    pins.negative? || pins > 10
  end

end

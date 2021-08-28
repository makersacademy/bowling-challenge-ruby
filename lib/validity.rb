class Validity

  def valid?(number, min, max)
    return false unless number.is_a? Integer

    number >= min && number <= max
  end

end

# rolls must have between 11 and 21 balls and all numbers must be between 0 and 10
def rolls_valid?(rolls)
  return false if rolls.length < 11 || rolls.length > 21
  return false if rolls.any? { |roll| roll > 10 || roll < 0 }
  true
end
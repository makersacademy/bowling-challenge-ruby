
def rolls_valid?(rolls)
  return false if rolls.length < 11 || rolls.length > 21
  rolls.each { |roll| return false if roll > 10 || roll < 0 }
  true
end
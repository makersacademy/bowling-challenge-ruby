
def rolls_valid?(rolls)
  rolls.each { |roll| return false if roll > 10 }
  true
end
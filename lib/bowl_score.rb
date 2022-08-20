# calculate score of rolls
def score(rolls)
  fail "Invalid rolls" unless rolls_valid?(rolls)
  game = to_frames(rolls)

  bonus = (0..8).map do |ind|
    # add in next roll if frame adds up to 10
    (game[ind].sum == 10 ? game[ind + 1][0] : 0 ) +
    # add second roll if strike
    (game[ind][0] == 10 ? game[(ind + 1)..-1].flatten[1] : 0 )
  end

  game.flatten.sum + bonus.sum
end

# convert rolls into 10 frames - up to 3 rolls allowed in 10th frame
def to_frames(rolls)
  result = (0..8).map { |frame| rolls[0] == 10 ? rolls.shift(1) : rolls.shift(2) }
  result << rolls.shift(rolls.length) 
end

# rolls must have between 11 and 21 balls and all numbers must be between 0 and 10
def rolls_valid?(rolls)
  return false if rolls.length < 11 || rolls.length > 21
  return false if rolls.any? { |roll| roll > 10 || roll < 0 }
  true
end
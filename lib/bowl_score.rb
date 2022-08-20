# calculate score of rolls
def score(rolls)
  fail "Invalid rolls" unless rolls_valid?(rolls)
  game = to_frames(rolls)

  bonus = game.map.each_with_index do |frame, ind|
    # add in the next roll if this frame adds up to 10 and is not last frame
    (frame.sum == 10 && ind < 9 ? game[ind + 1][0] : 0) +

    # add second roll if strike and not last frame
    (frame[0] == 10 && ind < 9 ? game[(ind + 1)..-1].flatten[1] : 0)
  end.sum

  rolls.sum + bonus
end

# convert rolls into frames - up to 3 rolls allowed in 10th frame
def to_frames(rolls)
  game = []
  frame_num = 0
  rolls.each do |roll|
    game[frame_num] == nil ? game << [roll] : game[frame_num] << roll
    frame_num += 1 if game[frame_num].length == 2 || game[frame_num].sum == 10
    frame_num = 9 if frame_num > 9
  end
  game
end

# rolls must have between 11 and 21 balls and all numbers must be between 0 and 10
def rolls_valid?(rolls)
  return false if rolls.length < 11 || rolls.length > 21
  return false if rolls.any? { |roll| roll > 10 || roll < 0 }
  true
end
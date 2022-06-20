def scorer(array)
  score = 0
  turn = 1
  array.each do |frame|
    if frame[0] == "X"
      score += (10 + array[turn][0] +  array[turn][1]) 
    elsif frame[1] == "/"
      score += 10 + array[turn][0]
    else
      score += (frame[0] + frame[1])
    end
    turn += 1
  end
  return score
end

 # #if @rolls[roll_index] == 10 # Strike
       #   score_card += 10 + @rolls[roll_index + 1] + @rolls[roll_index + 2]
      #  roll_index += 1

      Copy code
def score_card
  roll_index = 0
  score = 0
  
  10.times do
    if @rolls[roll_index] + @rolls[roll_index + 1] == 10 && @rolls[roll_index + 2]
      score += @rolls[roll_index] + @rolls[roll_index + 1] + @rolls[roll_index + 2]
    elsif @rolls[roll_index]
      score += @rolls[roll_index] + @rolls[roll_index + 1]
    end
    roll_index += 2
  end
  
  score
end
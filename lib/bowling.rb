def score_card
  total_score = 0
  frame = 1
  puts "Please roll and I will output the scores so far"
    while frame < 10 do
      puts "Frame: #{frame}"
      puts "What is roll one?"
      roll_one = gets.chomp.to_i
        total_score += roll_one
      puts "What is roll two?"
      roll_two = gets.chomp.to_i
        total_score += roll_two
      puts "Your score so far is: #{total_score}"
      frame += 1
    end
    return final_score_comment(total_score)
 end

 def final_score_comment(total_score)
  if total_score == 300
    puts "You got a perfect score!"
  elsif total_score == 0
    puts "Gutter Ball! Better luck next time."
  else
    puts "Your final score is: #{total_score}"
  end
end

 return score_card
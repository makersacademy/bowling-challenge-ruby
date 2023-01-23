# Incomplete

# Bad stuff: Tried diagramming, planning, but worried about what logic I'd use so started experimenting
# ...then went down a rabbit hole of experimenting with that code and never got out. No TDD, no tests, 
# no refactoring, not in the form of a class. Not certain exactly how to transform it into a class
# Good stuff: It largely keeps score as described...

score = [[0]]
fn = 0 
f = 1

10.times {
  puts "Input score Frame #{f} Ball 1"
  input = gets.chomp.to_i
if input < 10
  framescore = []
    if (score[fn].sum / score[fn].size) == 5  
       score[fn] << input
    end
  puts "Input score Frame #{f} Ball 2"
  input2 = gets.chomp.to_i
  f += 1
    if (score[fn].sum / score[fn].size) == 10
       score[fn] << input
       score[fn] << input2 
    end
   framescore << input
   framescore << input2
  if framescore.sum == 10
    puts "Spare!"
  end
   score << framescore
  p "Scorecard:#{score[1..-1]}"
  puts "Running total: #{score.flatten.sum}"
  fn += 1
elsif input == 10
  f += 1
   framescore = []
  puts "Strike!"
   if (score[fn].sum / score[fn].size) == 10 || (score[fn].sum / score[fn].size) == 5 
      score[fn] << input
      if (score[fn].sum / score[fn].size) == 10 && (score[fn - 1].sum / score[fn -1].size) == 10
        score[fn - 1] << input
      end
      framescore << input
      score << framescore
      p "Scorecard:#{score[1..-1]}"
      puts "Running total: #{score.flatten.sum}"
   else
      framescore << input
      score << framescore
      p "Scorecard:#{score[1..-1]}"
      puts "Running total: #{score.flatten.sum}"
    end
  fn += 1
end 
}
if (score[10].sum / score[10].size) < 10
  puts "Final score: #{score.flatten.sum} - Game Over!"
elsif (score[10].sum / score[10].size) == 10
  puts "Input score For Bonus Ball 1"
  input3 = gets.chomp.to_i
  if input3 == 10
    puts "Strike!"
    score[9] << input3
    score[10] << input3
    p "Scorecard:#{score[1..-1]}"
    puts "Running total: #{score.flatten.sum}"
    puts "Input score For Bonus Ball 2"
    input4 = gets.chomp.to_i
    if input4 == 10
      puts "Strike!"
      score[10] << input4
      p "Scorecard:#{score[1..-1]}"
       puts "Running total: #{score.flatten.sum} -  Maximum Score!"
    elsif input4 < 10
      score[10] << input4
      p "Scorecard:#{score[1..-1]} - Game Over"
    end
elsif input3 < 10
    score[10] << input3
    p "Scorecard:#{score[1..-1]}"
    puts "Running total: #{score.flatten.sum}"
    puts "Input score For Bonus Ball 2"
    input4 = gets.chomp.to_i
    score[10] << input4
    p "Scorecard:#{score[1..-1]}"
    puts "Running total: #{score.flatten.sum} - Game Over!"
  end
end


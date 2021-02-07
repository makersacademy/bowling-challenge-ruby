2.2.3 :001 > g = Game.play
=> Game X0939505924;
2.2.3 :002 > g.roll
=> frame 1 - roll 1 - please enter your score
=> frame 1 - roll 2 - please enter your score
Your frame score is 5
Your total score is 5
=> frame 2 - roll 1 - please enter your score
=> frame 2 - roll 2 - please enter your score
Your frame score is pending
Your total score is 5




count = 0
while count <= 10 do
  if score == 10
    total_score << 10
    puts "Frame score = pending"
    puts "Total score = #{total_score}"
    count += 1
  elsif score < 10
    total_score << score
    frame_score = score
    count += 1
  end

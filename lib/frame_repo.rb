def frame_points
  if roll_one != 10 && (roll_one + roll_two == 10)
  puts "You got a spare! Your first roll on frame(frame+1) will be added to total score"
  spare_points == true
elsif roll_one == 0
  puts "You got a strike! Your next two rolls on frame(frame+1) will be added to total score"
  strike_points == true
end

if spare_points == true
  # add the roll_one for next round of points * 2
end

if strike_points == true
  # add the roll_one and roll_two for next round of points
end

total_score = 0
frame_total = 10
current_frame = 1

frame_total.times do
  puts "--------------------------"
  puts "Frame: #{current_frame}"
  current_frame += 1

  roll_total = 2
  current_roll = 1
  pins_knocked_down = 0

  roll_total.times do
    puts "Roll: #{current_roll}"
    current_roll += 1

    puts "> How many pins were knocked down?"
    pins_knocked_down += gets.chomp.to_i

    #pins_knocked_down = rand()
  end

  total_score += pins_knocked_down
  puts "Total pins knocked down: #{pins_knocked_down}"  

end

puts "Total score = #{total_score}"
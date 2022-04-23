frame_count = 0
scores = []

9.times do
  puts "FRAME #{frame_count + 1}"
  print "Enter the score for the first roll: "
  first = gets.chomp.to_i
  if first == 10
    scores.push([10])
  else
    scores.push([first])
    print "\nEnter the score for the second roll: "
    second = gets.chomp.to_i
    scores[frame_count].push(second)
  end

  frame_count += 1
  puts "\n\n"
end

puts "FRAME 10 - THE FINAL FRAME"
print "Enter the score for the first roll: "
final_1 = gets.chomp.to_i
print "\nEnter the score for the second roll: "
final_2 = gets.chomp.to_i
scores.push([final_1, final_2])


if (final_1 == 10) || ((final_1 + final_2) == 10)
  print "\nEnter the score for the bonus roll: "
  final_3 = gets.chomp.to_i
  scores[9].push(final_3)
end

bonus_count = 0
bonus = 0

9.times do
  if (bonus_count == 8) && (scores[8][0] == 10)
    bonus += (scores[9][0] + scores[9][1])
  elsif (scores[bonus_count][0] == 10) && (scores[bonus_count + 1][0] == 10)
    bonus += (scores[bonus_count + 1][0] + scores[bonus_count + 2][0])
  elsif scores[bonus_count][0] == 10
    bonus += scores[bonus_count + 1].sum
  elsif scores[bonus_count].sum == 10
    bonus += scores[bonus_count + 1][0]
  end

  bonus_count += 1
end

total = scores.flatten.sum + bonus

print "\n\nYour total score for this game was #{total}!"
puts ' A perfect game! Wow!' if total == 300
puts "\n"
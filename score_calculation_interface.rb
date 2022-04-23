round_count = 0
scores = []

9.times do
  puts "ROUND #{round_count + 1}"
  print "Enter the score for the first bowl: "
  first = gets.chomp.to_i
  if first == 10
    scores.push([10])
  else
    scores.push([first])
    print "\nEnter the score for the second bowl: "
    second = gets.chomp.to_i
    scores[round_count].push(second)
  end

  round_count += 1
  puts "\n\n"
end

puts "ROUND 10 - THE FINAL ROUND"
print "Enter the score for the first bowl: "
final_1 = gets.chomp.to_i
print "\nEnter the score for the second bowl: "
final_2 = gets.chomp.to_i
scores.push([final_1, final_2])


if (final_1 == 10) || ((final_1 + final_2) == 10)
  print "\nEnter the score for the bonus bowl: "
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

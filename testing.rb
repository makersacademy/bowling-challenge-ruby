# frozen_string_literal: true

# Strike ignore roll 2

# What determines a strike - if roll = 1 and pins = 10 then strike
# If roll 1 + roll 2 = 10 pins then a spare and roll 1 =/= 0

# Encorporate strikes
# If a strike in frame 10 decrease i by 1 ...

i = 0
frame = 0
roll = 1
roll1score = 0
roll2score = 0
roll3score = 0
currentframescore = 0
totalscore = []
normal_strike_spare = 'normal'
roll1 = []
roll2 = []
roll3 = []
bonus = 0
turn = 0

while frame <= 10 # && (i <= 19)   # frame

  i += 1
  if i.even?
    frame = frame
    roll = 2

    p 'Input score'
    roll2score = gets.chomp.to_i
    roll2 << roll2score
    # for the 10th frame if roll1 plus roll 2 = 10 for spare allow to have a roll 3
    if (roll1score + roll2score >= 10) && (frame == 10)
      p 'Input score for frame 10 roll 3'
      roll3score = gets.chomp.to_i
    end

    puts 'score from roll 2'
    puts roll2score
    turn += 1

  else
    frame += 1
    roll = 1
    p 'Input score'
    roll1score = gets.chomp.to_i
    roll1 << roll1score

    puts 'score from roll 1'
    puts roll1score
    # Strike condition
    if roll1score == 10
      i += 1
      roll2 << 0
      turn += 1
    end

    # Spare condition
    if (frame == 10) && (roll1score == 10)
      p 'Input score for frame 10 roll 2'
      roll2score = gets.chomp.to_i
      p 'Input score for frame 10 roll 3'
      roll3score = gets.chomp.to_i

    end
    # currentframescore = roll1score + roll2score + roll3score
    # totalscore << currentframescore

  end

  puts 'turn'
  puts turn
  puts 'frame number'
  puts frame
  # puts 'roll1'
  # puts roll1
  # puts 'roll2'
  # puts roll2
  # puts 'totalscore'
  # puts totalscore
  puts 'roll number'
  puts roll

end

puts 'roll 1 for frame 5'
puts roll1[6]

# puts 'frame number'
# puts frame
puts 'roll1'
puts roll1
# puts 'roll1sum'
# puts roll1.sum
puts 'roll2'
puts roll2
# puts 'roll2sum'
# puts roll2.sum
# puts 'totalscore'
# puts totalscore
# puts 'bonus'
# puts bonus

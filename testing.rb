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

while (frame <= 10) && (i <= 19)

  i += 1
  if i.even?
    frame = frame
    roll = 2

    p 'Input score'
    roll2score = gets.chomp.to_i
    # for the 10th frame if roll1 plus roll 2 = 10 for spare allow to have a roll 3
    if (roll1score + roll2score >= 10) && (frame == 10)
      p 'Input score for frame 10 roll 3'
      roll3score = gets.chomp.to_i
    end

    puts 'score from roll 2'
    puts roll2score

  else
    frame += 1
    roll = 1
    p 'Input score'
    roll1score = gets.chomp.to_i
    puts 'score from roll 1'
    puts roll1score
    roll1score == 10 ? i += 1 : i = i
    if (frame == 10) && (roll1score == 10)
      p 'Input score for frame 10 roll 2'
      roll2score = gets.chomp.to_i
      p 'Input score for frame 10 roll 3'
      roll3score = gets.chomp.to_i
    end
    currentframescore = roll1score + roll2score + roll3score
    totalscore << currentframescore
    
    puts 'currentframescore'
    puts currentframescore
    puts 'totalscore'
    puts totalscore



  end

  # puts 'i number'
  # puts i
  puts 'frame number'
  puts frame
  # puts 'roll number'
  # puts roll

end

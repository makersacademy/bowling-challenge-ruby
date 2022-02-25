# frozen_string_literal: true

# Strike ignore roll 2

# What determines a strike - if roll = 1 and pins = 10 then strike
# If roll 1 + roll 2 = 10 pins then a spare and roll 1 =/= 0

# Encorporate strikes
# If a strike in frame 10 decrease i by 1 ...

i = 0
frame = 0
# score = 10



while (frame <= 10) && (i <= 19)



  
  
  i += 1
  if i.even?
    frame = frame
    roll = 2

    p "Input score"
    roll2score = gets.chomp.to_i
    # if roll1 plus roll 2 = 10 for spare
    puts 'score from roll 2'
    puts roll2score

  else
    frame += 1
    roll = 1
    p "Input score"
    roll1score = gets.chomp.to_i
    roll1score == 10? i += 1 : i = i
    puts 'score from roll 1'
    puts roll1score
  end

  # puts 'i number'
  # puts i
  # puts 'frame number'
  # puts frame
  # puts 'roll number'
  # puts roll

end





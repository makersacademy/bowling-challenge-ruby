def frame
    array_of_frame_rolls = []
    while array_of_frame_rolls.length < 2 && !array_of_frame_rolls.include?(10)
      puts "Enter pins down"
      pins = gets.chomp.to_i
      array_of_frame_rolls.push(pins)
    end
    puts "Strike!" if array_of_frame_rolls[0] == 10
    puts "Spare!" if array_of_frame_rolls.sum == 10 && array_of_frame_rolls[0] != 10
    puts array_of_frame_rolls.to_s
    return array_of_frame_rolls
   end
    
   def game
    array_of_frames = []
    while array_of_frames.length < 10
      array_of_frames.push(frame)
    end
    puts array_of_frames.to_s
    return array_of_frames
   end
    
   def frame_10_strike
    extra_rolls = game 
    if extra_rolls[-1][0] == 10
      puts "2 extra rolls!"
      array_of_frame_rolls = []
      2.times do
        puts "Enter pins down"
        pins = gets.chomp.to_i
        array_of_frame_rolls.push(pins)
      end
      extra_rolls[-1].push(array_of_frame_rolls).flatten!
      puts extra_rolls.to_s
    end
   end
    
    
   def frame_10_spare
    extra_rolls = game 
    if extra_rolls[-1].sum == 10 && extra_rolls[-1][0] != 10
      puts "1 extra roll!"
      puts "Enter pins down"
      pins = gets.chomp.to_i
      extra_rolls[-1].push(pins)
      puts extra_rolls.to_s
    end
   end
   
   
    
   def calc(rolls)
   score = 0
   counter = 0
   while counter < 10
   if rolls[counter].length == 1 && counter == 8
    score += rolls[counter].sum + rolls[counter + 1][0] + rolls[counter + 1][1]
   elsif rolls[counter].length == 1
    score += rolls[counter].sum + rolls[counter + 1].sum
   elsif rolls[counter].sum == 10
    score += rolls[counter].sum + rolls[counter + 1][0]
   else
    score += rolls[counter].sum
   end
   counter += 1
   end
   puts score
   end
   
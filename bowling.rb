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
    puts array_of_frames.to_s
  end
     if array_of_frames[9].sum == 10 && array_of_frames[9][0] != 10
    puts "1 extra roll!"
    puts "Enter pins down"
    pins = gets.chomp.to_i
    array_of_frames[-1].push(pins)
    puts array_of_frames.to_s
    return array_of_frames
     elsif 
     array_of_frames[9][0] == 10
    puts "2 extra rolls!"
    array_of_frame_rolls = []
    2.times do
      puts "Enter pins down"
      pins = gets.chomp.to_i
      array_of_frame_rolls.push(pins)
    end
    array_of_frames[-1].push(array_of_frame_rolls).flatten!
    puts array_of_frames.to_s
    return array_of_frames
  else
    return array_of_frames
  end
  end
 

class Bowling

  def initialize
    @rolls = []
  end

  def roll(pins)
    pins.flatten!
    counter = 0
    while counter < pins.length do
      @rolls.push(pins[counter])
      counter += 1
    end
  end

  def score
    result = 0
    turns = 0
    10.times do
        if strike?(turns)
        result += strike_score(turns)
        turns += 1
      elsif spare?(turns)
        result += spare_score(turns)
        turns += 2
      else 
        result += normal_score(turns)
        turns += 2
      end
    end
    return result
  end
  
  def strike?(turns)
    @rolls[turns] == 10;
  end

  def spare?(turns)
    @rolls[turns] + @rolls[turns + 1] == 10;
  end

  def strike_score(turns)
    10 + @rolls[turns + 1] + @rolls[turns + 2]
  end 

  def spare_score(turns)
    10 + @rolls[turns + 2]
  end 

  def normal_score 
     @rolls[turns] + @rolls[turns + 1]
  end

end


test = Bowling.new

test.roll(game)

puts test.score

class Log

    def initialize
      @array_of_frames = []
    end  
  
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
    while @array_of_frames.length < 10
      @array_of_frames.push(frame)
      puts @array_of_frames.to_s
    end
    if strike?
       strike_log
    elsif spare?
       spare_log
    else
      return @array_of_frames
    end
    end
  
     def strike?
      @array_of_frames[9][0] == 10
     end
    
     def spare?
       @array_of_frames[9].sum == 10 && @array_of_frames[9][0] != 10
     end
  
     def spare_log
       puts "1 extra roll!"
       puts "Enter pins down"
       pins = gets.chomp.to_i
       @array_of_frames[-1].push(pins)
       puts @array_of_frames.to_s
       return @array_of_frames
     end 
  
    
     def strike_log
        puts "2 extra rolls!"
        array_of_frame_rolls = []
        2.times do
          puts "Enter pins down"
          pins = gets.chomp.to_i
          array_of_frame_rolls.push(pins)
        end
        @array_of_frames[-1].push(array_of_frame_rolls).flatten!
        puts @array_of_frames.to_s
        return @array_of_frames
    end 
  end
   
  
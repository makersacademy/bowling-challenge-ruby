class Scorecard

  @@current_score = 0

  def self.current_score
    Frames.all_frames.each_with_index do |frame, num|
      @@current_score += (frame.rolls[0].to_i + frame.rolls[1].to_i)
      strike_bonus(frame) if frame.rolls.count == 1
      spare_bonus(frame) if (frame.rolls[0].to_i + frame.rolls[1].to_i) == 10
    end
    puts "your current score is: #{@@current_score}"
    @@current_score = 0
  end

  def self.strike_bonus(frame)  
    Roll.all_rolls.each_with_index do |roll, ind|
      if roll.object_id == frame.rolls[0].object_id
        if Frame.all_rolls.length >= ind+3
          @@current_score += (Frame.all_rolls[ind+1].to_i + Frame.all_rolls[ind+2].to_i)
        else
          puts "strike bonus pending..." 
        end
      end
    end
  end

  def self.spare_bonus(frame)
    Roll.all_rolls.each_with_index do |roll, ind|
      if roll.object_id == frame.rolls[1].object_id
        if Roll.all_rolls.length >= ind+2
          @@current_score += (Roll.all_rolls[ind+1].to_i)
        else
          puts "spare bonus pending..." 
        end
      end
    end
  end

end
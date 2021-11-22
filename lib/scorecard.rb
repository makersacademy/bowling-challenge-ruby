

class Scorecard

  @@current_score = 0

  def self.final_score
    current_score
    puts "your final score is: #{@@current_score}"
    @@current_score
  end

  def self.current_score
    @@current_score = 0
    Frame.frames.each_with_index do |frame, num|
      @@current_score += frame.rolls.map(&:to_f).reduce(0,:+)
      @@current_score -= frame.rolls[2].to_i if frame.rolls.count > 2
      @@current_score -= frame.rolls[1].to_i if frame.rolls.count > 2 && frame.rolls[0].to_i == 10
      puts @@current_score
      strike_bonus(frame) if frame.rolls[0].to_i == 10
      if frame.rolls.length >= 2
        spare_bonus(frame) if (frame.rolls[0].to_i + frame.rolls[1].to_i) == 10
      end
    end
    puts "your current score is: #{@@current_score}"
  end

  def self.strike_bonus(frame)  

    Roll.rolls.each_with_index do |roll, ind|
      if roll.object_id == frame.rolls[0].object_id
        if Roll.rolls.length >= ind+3
          @@current_score += (Roll.rolls[ind+1].to_i + Roll.rolls[ind+2].to_i)
        else
          puts "strike bonus pending..." 
        end
      end
    end
  end

  def self.spare_bonus(frame)
    Roll.rolls.each_with_index do |roll, ind|
      if roll.object_id == frame.rolls[1].object_id
        if Roll.rolls.length >= ind+2
          @@current_score += (Roll.rolls[ind+1].to_i)
        else
          puts "spare bonus pending..." 
        end
      end
    end
  end

end
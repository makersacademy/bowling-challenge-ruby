class Scorecard

  attr_reader :current_score, :final_score

  def final_score
    current_score
    puts "your final score is: #{@current_score}"
    @current_score
  end

  def current_score
    @current_score = 0
    Frame.frames.each_with_index do |frame, ind|
      # add regular scores (different rules for last frame)
      @current_score += frame.rolls.map(&:to_f).reduce(0,:+) unless ind == 9
      @current_score += frame.rolls[0].to_i if ind == 9
      @current_score += frame.rolls[1].to_i if ind == 9 && frame.rolls[0].to_i != 10
      #add strike bonus
      strike_bonus(frame) if frame.rolls[0].to_i == 10
      #add spare bonus
      if frame.rolls.length >= 2
        spare_bonus(frame) if (frame.rolls[0].to_i + frame.rolls[1].to_i) == 10
      end
    end
    puts "your current score is: #{@current_score}"
  end

  def strike_bonus(frame)  
    Roll.rolls.each_with_index do |roll, ind|
      if roll.object_id == frame.rolls[0].object_id
        if Roll.rolls.length >= ind+3
          #add next 2 rolls for strike bonus...
          @current_score += (Roll.rolls[ind+1].to_i + Roll.rolls[ind+2].to_i)
        else
          #unless there aren't yet enough rolls
          puts "strike bonus pending..." 
        end
      end
    end
  end

  def spare_bonus(frame)
    Roll.rolls.each_with_index do |roll, ind|
      if roll.object_id == frame.rolls[1].object_id
        if Roll.rolls.length >= ind+2
          #add next roll for spare bonus...
          @current_score += (Roll.rolls[ind+1].to_i)
        else
          #unless there aren't yet enough rolls
          puts "spare bonus pending..." 
        end
      end
    end
  end

end
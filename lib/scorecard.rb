class Scorecard

  attr_reader :current_score, :final_score

  def final_score
    current_score
    puts "\n\nYour final score is: #{@current_score}!\n"
    @current_score
  end

  def current_score
    @current_score = 0
    score_pins
    score_bonuses
    puts "\nYour current score is: #{@current_score}\n\n"
  end

  def score_pins
    Frame.frames.each_with_index do |frame, ind|
      if frame.final_frame
        @current_score += frame.rolls[0].to_i 
        @current_score += frame.rolls[1].to_i if frame.rolls[0].to_i != 10
      else
        @current_score += frame.rolls.map(&:to_f).reduce(0,:+)
      end
    end
  end

  def score_bonuses
    Frame.frames.each_with_index do |frame, ind|
      if frame.rolls[0].to_i == 10
        strike_bonus(frame)
      else
        spare_bonus(frame) if (frame.rolls[0].to_i + frame.rolls[1].to_i) == 10
      end
    end
  end

  def strike_bonus(frame)  
    Roll.rolls.each_with_index do |roll, ind|
      if roll.object_id == frame.rolls[0].object_id
        if Roll.rolls.length >= ind+3
          @current_score += (Roll.rolls[ind+1].to_i + Roll.rolls[ind+2].to_i)
        else
          puts "Strike bonus pending..." 
        end
      end
    end
  end

  def spare_bonus(frame)
    Roll.rolls.each_with_index do |roll, ind|
      if roll.object_id == frame.rolls[1].object_id
        if Roll.rolls.length >= ind+2
          @current_score += (Roll.rolls[ind+1].to_i)
        else
          puts "Spare bonus pending..." 
        end
      end
    end
  end

end

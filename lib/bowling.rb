class Bowling
  attr_reader :score, :current_frame

  def initialize
    @score = 0
    @current_frame = 1
    @bonus_roll = 0
  end

  def process_frame(rolls)
    fail "Game over." if @current_frame > 10

    # Calculate roll score
    rolls.each do |roll|
      @score += roll

      # Calculates num of strikes
      consecutive_strikes = (roll == 10) && (@bonus_roll == 2)
      multiplier = consecutive_strikes ? 2 : 1
    
      # Apply bonus from previous roll
      if @bonus_roll > 0
        @score += roll * multiplier
        @bonus_roll -= 1
      end
    end

    # Update bonus for next roll
    @bonus_roll = 
      if rolls[0] == 10
        2
      elsif rolls[0] + rolls[1] == 10
        1
      else
        0
      end

    @current_frame += 1
  end

  def report_score
    if @score == 0
      "Game over, you scored 0 points."    
    elsif @score == 300
      "Congratulations on your perfect game! You scored 300 points!"
    else
      "You scored #{@score} points!"
    end
  end
end
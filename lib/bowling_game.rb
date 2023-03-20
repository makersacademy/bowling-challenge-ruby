class BowlingGame

  def initialize
    # Empty array that contains no 'rolls' when a new game is created
    @rolls = []
  end

  def roll(pins) # Pins is the number of pins knocked down in a roll
    # Pushes the roll (number of pins) into the rolls array
    @rolls << pins
  end

  def score
    total_score = 0
    # Index of the @rolls array
    roll_index = 0

    # Loops through frame 10 times to cover a full game
    10.times do |frame|
      if @rolls[roll_index] == 10
        total_score += 10 + @rolls[roll_index + 1] + @rolls[roll_index + 2]
        roll_index += 1
      elsif spare?(roll_index)
        total_score += spare_score(roll_index)
        roll_index += 2
      else
        total_score += @rolls[roll_index] + @rolls[roll_index + 1] 
        roll_index += 2
      end
    end

    return total_score
  end

  private
  
  def spare?(roll_index)
    @rolls[roll_index] + @rolls[roll_index + 1] == 10
  end

  def spare_score(roll_index)
    10 + @rolls[roll_index + 2]
  end
  

end
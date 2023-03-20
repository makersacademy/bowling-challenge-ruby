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
    roll_index = 0

    10.times do |frame|
      if @rolls[roll_index] + @rolls[roll_index + 1] == 10
        total_score += 10 + @rolls[roll_index + 2]
        roll_index += 2
      else
        total_score += @rolls[roll_index] + @rolls[roll_index + 1] 
        roll_index += 2
      end
    end

    return total_score
  end

end
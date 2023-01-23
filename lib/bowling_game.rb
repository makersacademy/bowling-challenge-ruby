class BowlingGame
  def initialize
    @player_rolls = []
  end

  def roll(pins_knocked_down)
    if pins_knocked_down > 10
      raise "Invalid number, pins knocked down must be a number from 0 to 10"
    end
    @player_rolls.push(pins_knocked_down)
  end

  def score
    roll_index = 0
    scorecard = 0

    10.times do 
      if roll_a_strike?(roll_index)
        scorecard += strike_score(roll_index)
        roll_index += 1
      elsif roll_a_spare?(roll_index)
        scorecard += spare_score(roll_index)
        roll_index += 2
      else
        scorecard  += score_of_frame(roll_index)
        roll_index += 2
      end
    end
    return scorecard
  end


  private

  def roll_a_strike?(roll_index)
    @player_rolls[roll_index] == 10
  end

  def strike_score(roll_index)
    @player_rolls[roll_index] + @player_rolls[roll_index + 1] + @player_rolls[roll_index + 2]
  end

  def roll_a_spare?(roll_index)
    @player_rolls[roll_index] + @player_rolls[roll_index + 1] == 10
  end

  def spare_score(roll_index)
    @player_rolls[roll_index] + @player_rolls[roll_index + 1] + @player_rolls[roll_index + 2]
  end

  def score_of_frame(roll_index)
    @player_rolls[roll_index] + @player_rolls[roll_index + 1]
  end

end






# user_rolls = [6,7,9,2,1,6,3,5];
#               0,1,2,3,4,5,6,7 
#               current index = 0

# user_rolls = [10,7,3,2,1,6,3,5];
#               currentindex = 2  (10)
#               currentindex + 1  (2)
              # currentindex + 2  (9)


class Bowling_game

  def initialize
    @rolls = []
  end

  def roll(pins)
    @rolls.push(pins)
  end

  def score
    result = 0
    # I am using a roll_count as an index for amount of rolls. i.e roll 1, 2 or 3. 
    roll_count = 0
    # There are 10 frames in total. 
    10.times do
      if strike?(roll_count)
        result += strike_score(roll_count)
        roll_count += 1
      elsif spare?(roll_count)
        result += spare_score(roll_count)
        roll_count += 2
      else
        result += frame_count(roll_count)
        roll_count += 2
      end
    end
    result
  end

  def spare?(roll_count)
    #if your first roll and your second roll equal 10 than award a spare
    @rolls[roll_count] + @rolls[roll_count + 1] == 10
  end

  def spare_score(roll_count)
    # if both your rolls equate to 10, your next shot in the next frame is added on to the toal of the last.
    10 + @rolls[roll_count + 2]
  end 

  def strike?(roll_count)
    # if your first roll is a 10, it becomes a strike!
    @rolls[roll_count] == 10
  end 

  def strike_score(roll_count)
    # if both your rolls equate to 10, your next shot in the next frame is added on to the toal of the last.
    10 + @rolls[roll_count + 1] + @rolls[roll_count + 2]
  end 

  def frame_count(roll_count)
    # Two rolls without a spare or strike will end the frame. 
    @rolls[roll_count] + @rolls[roll_count + 1]
  end

end
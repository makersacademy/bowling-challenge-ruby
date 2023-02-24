class Frame
  def initialize(is_tenth = false)
    @is_tenth = is_tenth
    @rolls = @is_tenth ? [0, 0, 0] : [0, 0] # scores is an array of numbers
    @roll_index = 0
  end

  def getRolls
    return @rolls
  end

  # adds a roll score to the array
  def add(pins) # pins is a number
    return if is_finished?()
    @rolls[@roll_index] = pins
    @roll_index += 1

  end

  # sums the scores of rolls in this frame
  # returns the frame score
  def roll_score
    @rolls.sum
  end

  # returns a boolean
  def is_finished?(index = @roll_index, rolls = @rolls)
    # if the player played 2 rolls
    # if the player made a strike at the first roll
    if @is_tenth
      if is_spare?(rolls) || is_strike?(rolls)
        # if the player plays a strike or spare => index > 2
        return index > 2
      else
        # else normal => index > 1
        return index > 1
      end
    else
      if index > 1 || is_strike?(rolls)
        return true
      else 
        return false
      end
    end
  end

  # returns boolean
  def is_spare?(rolls = @rolls, index = @roll_index)
   return rolls[0] + rolls[1] == 10
    # is the first & second roll == 10?
  end

  # returns boolean
  def is_strike?(rolls = @rolls)
    return rolls[0]  == 10
    # is the first roll == 10?
  end
end

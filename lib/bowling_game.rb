class BowlingGame
  def initialize
    @rolls = []
  end

  def roll(pins)
    @rolls.push pins
  end

  def score
    result = 0
    rolls_count = 0

    # 20.times do # 20 = no of rolls in 10 frames
    #   result += @rolls[rolls_count]
    #   rolls_count += 1
    # the above 3 lines counts the score by roll. to refactor, we will count by frame next as follows:

    10.times do # no of frames
      if @rolls[rolls_count] + @rolls[rolls_count + 1] == 10 #if the fisrt and second roll [+1] is equal to 10
        result = @rolls[rolls_count] + @rolls[rolls_count + 1] + @rolls[rolls_count +2] #then add the next roll twice to the result
        
      elsif result += @rolls[rolls_count] + @rolls[rolls_count + 1] # frame = 2 rolls
    end
    rolls_count += 2 # add another 2 rolls
end
    result
  end
end

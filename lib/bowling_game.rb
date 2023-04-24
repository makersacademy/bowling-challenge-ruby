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

    10.times do 
      if strike(rolls_count)
        result += strikeScore(rolls_count)
        rolls_count += 1
      elsif spare(rolls_count)
        result += spareScore(rolls_count)
        rolls_count += 2
      else
        result += frame(rolls_count)
        rolls_count += 2
      end
    end
    result
  end


  def frame(rolls_count)
    @rolls[rolls_count] + @rolls[rolls_count + 1] 
  end


  def spare(rolls_count)
    @rolls[rolls_count] + @rolls[rolls_count + 1] == 10
  end


  def spareScore(rolls_count)
    10 + @rolls[rolls_count + 2]
  end


  def strike(rolls_count)
    @rolls[rolls_count] == 10
  end


  def strikeScore(rolls_count)
    10 + @rolls[rolls_count + 1] + @rolls[rolls_count + 2]
  end
end

# def score
#     result = 0
#     rolls_count = 0

#     # 20.times do # 20 = no of rolls in 10 frames
#     #   result += @rolls[rolls_count]
#     #   rolls_count += 1
#     # the above 3 lines counts the score by roll. to refactor, we will count by frame next as follows:

#     10.times do # no of frames
#       if @rolls[rolls_count] == 10 # if strike
#         result += @rolls[rolls_count] + @rolls[rolls_count + 1] + @rolls[rolls_count + 2] # add 10 + the next 2 rolls
#         rolls_count += 1 # 1 roll has been added, move onto next frame

#       elsif @rolls[rolls_count] + @rolls[rolls_count + 1] == 10 # if the first and second roll [+1] is equal to 10
#         result += @rolls[rolls_count] + @rolls[rolls_count + 1] + @rolls[rolls_count + 2] # then add the next roll twice to the result
#         rolls_count += 2 # 2 rolls have been added, move onto next frame

#       elsif result += @rolls[rolls_count] + @rolls[rolls_count + 1] # frame = 2 rolls
#         rolls_count += 2 # 2 rolls have been added, move onto next frame
#       end
#     end
#     result
#   end

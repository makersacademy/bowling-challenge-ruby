class Scoreboard
  def initialize
    @rolls = [] # array that will store down number of knocked pins after each roll
    @current_roll = 0 #to keep track of the current roll. Initalising means it is ready to take information so it 
    # can calculate the score
  end

  def roll(pins)
    @rolls[@current_roll] = pins
    @current_roll += 1
  end

  def score
    total_score = 0 
    roll_number = 0
    10.times do
      if @rolls[roll_number] == 10 # FOR A STRIKE
        total_score += 10 + @rolls[roll_number + 1] + @rolls[roll_number + 2]
        roll_number += 1
      elsif @rolls[roll_number] + @rolls[roll_number + 1] == 10 # STRIKE
        total_score += 10 + @rolls[roll_number + 2]
        roll_number += 2
      else
        total_score += @rolls[roll_number] + @rolls[roll_number + 1] # frame 
        roll_number += 2
      end
    end
    return total_score
  end

  def gutter(roll_number)
    return @rolls[roll_number] == 0
  end
end
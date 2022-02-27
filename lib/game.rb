# frozen_string_literal: true

# Generate the rolls
# Generate the frame number

# Start in a frame
# Base the decisions on if we have a roll 2 based on if roll 1< 10

class Game
  def initialize
    @rolls = []
  end

  def roll pins
    @rolls << pins
    p @rolls
  end

  def score
    #@rolls.reduce(:+)  
    result = 0
    rollindex = 0
    10.times do
      if @rolls[rollindex] + @rolls[rollindex + 1] == 10
        result += @rolls[rollindex] + @rolls[rollindex + 1] + @rolls[rollindex + 2]
      else
        result += @rolls[rollindex] + @rolls[rollindex + 1]
      end
      rollindex += 2
    end
    result
  end
end

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
    result = 0
    rollindex = 0
    10.times do
      if strike? rollindex
        result += strikeScore rollindex
        rollindex += 1
      elsif spare? rollindex
        result += spareScore rollindex
        rollindex += 2
      else
        result += frameScore rollindex
        rollindex += 2
      end
    end
    result
  end

  def spare? rollindex
    @rolls[rollindex] + @rolls[rollindex + 1] == 10
  end

  def strike? rollindex
    @rolls[rollindex]  == 10
  end

  def frameScore rollindex
    @rolls[rollindex] + @rolls[rollindex + 1]
  end

  def spareScore rollindex
    @rolls[rollindex] + @rolls[rollindex + 1] + @rolls[rollindex + 2]
  end

  def strikeScore rollindex
    @rolls[rollindex] + @rolls[rollindex + 1] + @rolls[rollindex + 2]
  end
  



end

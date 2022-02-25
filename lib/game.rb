# frozen_string_literal: true

# Generate the rolls
# Generate the frame number

# Start in a frame
# Base the decisions on if we have a roll 2 based on if roll 1< 10

class Game
  attr_reader :score

  def initialize
    @score = 0
  end

  def pins(n)
    @score += n
  end
end

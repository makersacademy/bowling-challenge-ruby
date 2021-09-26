# frozen_string_literal: true

class Game
  attr_reader :rolls, :score

  def initialize
    @rolls = []
    @score = 0
  end

  def roll(num)
    @rolls << num
  end

  def score
    total_score  = 0
    current_roll = 0

    while current_roll < @rolls.size - 1
      roll      = @rolls[current_roll]
      next_roll = @rolls[current_roll + 1]

      if roll + next_roll == 10
        total_score += 10 + @rolls[current_roll + 2]
      else
        total_score += roll + next_roll
      end

      current_roll += 2
    end

    return total_score
  end
end

#   attr_reader :roll_one, :roll_two

# def initialize(roll_one, roll_two)
#   @roll_one = roll_one
#   @roll_two = roll_two
# end

# def total_of_frame
#   roll_one + roll_two
# end

# def spare?
#   if roll_one + roll_two == 10 && roll_one != 10
#     true
#   else
#     false
#   end
# end

# def strike?
#   if roll_one == 10 && roll_two == 0
#     true
#   else
#     false
#   end
# end

# frozen_string_literal: true

require_relative 'roll'

# Frame class
class Frame

  attr_reader :scoring_rolls

  def initialize(roll_class = Roll)
    @roll_class = roll_class
    @scoring_rolls = []
  end

  def create_roll
    roll = @roll_class.new(self)
    @scoring_rolls << roll
    roll
  end
end

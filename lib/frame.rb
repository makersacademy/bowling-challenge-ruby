# frozen_string_literal: true

require_relative 'roll'

# Frame class
class Frame
  def initialize(roll_class = Roll)
    @roll_class = roll_class
  end

  def create_roll
    @roll_class.new(self)
  end
end

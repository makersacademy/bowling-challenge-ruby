# frozen_string_literal: true

class Frame
  attr_reader :roll1, :roll2

  def initialize(roll1:, roll2:)
    @roll1 = roll1
    @roll2 = roll2
  end
end

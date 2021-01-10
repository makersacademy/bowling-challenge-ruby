# frozen_string_literal: true

class FrameTen < Frame
  attr_reader :roll3

  def initialize(roll1, roll2, roll3 = 0)
    @roll3 = roll3
    super(roll1, roll2)
  end
end

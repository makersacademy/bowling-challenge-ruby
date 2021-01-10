# frozen_string_literal: true

class Frame
  attr_reader :roll1, :roll2
  attr_accessor :frame_score

  def initialize(roll1, roll2 = 0)
    @roll1 = roll1
    @roll2 = roll2
    @frame_score = @roll1 + @roll2
  end
end

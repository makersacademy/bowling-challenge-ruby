# frozen_string_literal: true

class Frame
  attr_accessor :framescore

  def initialize
    @framescore = { roll_1: nil,
                    roll_2: nil,
                    bonus: nil }
  end
end

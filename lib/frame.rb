# frozen_string_literal: true

class Frame
  attr_reader :frame_hash

  def self.create(turn)
    case turn.size
    when 2
      @frame_hash = { frame_number: turn[0], roll1: turn[1] }
    when 3
      @frame_hash = { frame_number: turn[0], roll1: turn[1], roll2: turn[2] }
    end
  end
end

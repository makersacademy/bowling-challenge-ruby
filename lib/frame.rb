# frozen_string_literal: true

class Frame
  attr_reader :frame_number, :rolls

  def initialize(frame_number)
    @frame_number = frame_number
    @rolls = []
  end

  def add_roll(pins)
    raise 'Frame complete' if frame_over?

    @rolls << pins
  end

  

  def frame_over?
    @rolls[0] == 10 || @rolls.length == 2
  end
end

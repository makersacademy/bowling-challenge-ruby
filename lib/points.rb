# frozen_string_literal: true
require 'frame'

class Points
  attr_reader :total, :frames

  def initialize(frame = Frame.new)
    @total = 0

    @frames = []

    10.times { @frames << frame }
  end

  def update_roll(current_frame, current_roll, pins_knocked_down)
    @frames[current_frame - 1].update_roll(current_roll, pins_knocked_down)
  end
end

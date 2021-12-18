# frozen_string_literal: true
require 'frame'

class Points
  attr_reader :current_score, :frames

  def initialize(frame = Frame.new)
    @current_score = 0

    @frames = []

    10.times { @frames << frame }
  end

  def update_roll(current_frame, current_roll, pins_knocked_down)
    @frames[current_frame - 1].update_roll(current_roll, pins_knocked_down)
  end

  def update_total(score)
    @current_score += score
  end
end

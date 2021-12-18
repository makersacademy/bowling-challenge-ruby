# frozen_string_literal: true
require 'frame'

class Points
  attr_reader :total, :frames

  def initialize(frame = Frame.new)
    @total = 0

    @frames = []

    10.times { @frames << frame }
  end
end

require_relative "frame"

class Game

  attr_reader :frames

  def initialize
    @frames = []
  end

  def create_frame
    frames << Frame.new(frames.length + 1)
  end

  def input_roll(pins)
    if frames.empty? || frames[-1].completed?
      create_frame
    end
    frames[-1].add_roll(pins)
  end

end

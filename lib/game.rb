require_relative "frame"

class Game

  attr_reader :frames

  def initialize
    @frames = []
  end

  def create_frame
    frames << Frame.new(frames.length + 1)
  end

end

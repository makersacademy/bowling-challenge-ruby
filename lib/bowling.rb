require_relative "frame"

class Bowling
  def initialize
    @frames = []
    @current_frame = Frame.new
  end
end

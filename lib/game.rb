class Game
  attr_reader :score, :current_frame

  def initialize(frame_class = Frame)
    @score = 0
    @current_frame = frame_class.new
  end

  def add_roll(pins)
    current_frame.add_roll(pins)
  end
end

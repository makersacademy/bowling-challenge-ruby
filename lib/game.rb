class Game
  attr_reader :current_frame, :frames

  def initialize(frame_class = Frame)
    @frame_class = frame_class
    @current_frame = new_frame
    @frames = []
  end

  def add_roll(pins)
    current_frame.add_roll(pins)
    return unless current_frame.over?

    frames << current_frame
    new_frame
  end

  def score
    0
  end

  private

  attr_reader :frame_class
  attr_writer :current_frame

  def new_frame
    self.current_frame = frame_class.new
  end
end

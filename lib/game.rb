class Game

  attr_reader :score, :current_frame

  def initialize(frame_class = Frame)
    @score = 0
    @frame_class = frame_class
    @current_frame = new_frame
  end

  def add_roll(pins)
    current_frame.add_roll(pins)
    new_frame if current_frame.over?
  end

  private
  attr_reader :frame_class
  attr_writer :current_frame

  def new_frame
    self.current_frame = frame_class.new
  end

end
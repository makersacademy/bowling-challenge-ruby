require 'frame'

class Game

  attr_reader :current_frame

  def initialize(frame_class = Frame)
    @frame_class = frame_class
    @current_frame = frame_class.new
    @frames = []
  end

  def input_roll(pins)
    @current_frame.roll(pins)
    next_frame if @current_frame.complete?
  end

  def next_frame
    @frames << @current_frame
    create_frame
  end

  def create_frame
    @current_frame = @frame_class.new
  end

  def frames
    @frames.dup
  end

end
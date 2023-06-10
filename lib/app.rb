require_relative 'frame'

class Application
  def initialize
    @frames = []
    @current_frame = 1
    @current_frame_ball = 1
    create_frames
  end

  def create_frames
    10.times do |i|
      frame = Frame.new(i + 1)
      @frames.push(frame)
    end
  end

  def return_frames
    return @frames
  end
end
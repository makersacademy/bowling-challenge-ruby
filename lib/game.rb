require_relative './frame'

class Game

  attr_reader :frame

  def initialize(frame = Frame.new)
    @frame = 0
    @total_score = 0
    @frame = frame
    @frame_no = 1
  end

  def change_frame
    @frame_no += 1
  end

  def total_score
    @total_score = @frame.knocked_down_pins_log.sum
  end
end

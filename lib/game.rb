require_relative './frame'
require 'stringio'

class Game

  def play_frame(frame = Frame.new)
    first_roll = frame.roll
    frame.update_score(:first_roll, first_roll)
    second_roll = frame.roll
    frame.update_score(:second_roll, second_roll) unless frame.strike?
    frame.frame_score
  end

end

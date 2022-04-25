require_relative './frame'
require 'stringio'

class Game

  def play_frame(frame = Frame.new)
    first_roll = frame.roll
    frame.update_score(:first_roll, first_roll)
    unless frame.strike?
      second_roll = frame.roll
      frame.update_score(:second_roll, second_roll)
    end
    p frame.frame_score
  end

  def play(frame_class = Frame)
    gamesheet = []
    10.times { gamesheet << play_frame(frame_class.new) }
    gamesheet
  end

end

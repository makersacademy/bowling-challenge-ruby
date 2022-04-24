require_relative './frame'
require 'stringio'

class Game
  def play_frame(frame = Frame.new)
    frame_score = { first_roll: nil, second_roll: nil}
    first_roll = frame.roll
    frame_score[:first_roll] = first_roll
    unless frame_score[:first_roll] == 10
      second_roll = frame.roll
      frame_score[:second_roll] = second_roll
    end
    frame_score
  end
end
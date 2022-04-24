require_relative './frame'
require 'stringio'

class Game

  def initialize
    @frame_score  = { first_roll: nil, second_roll: nil}
  end

  def play_frame(frame = Frame.new)
    @frame_score[:first_roll] = frame.roll
    @frame_score[:second_roll] = frame.roll unless strike?
    @frame_score
  end

  private

  def strike?
    @frame_score[:first_roll] == 10
  end
end

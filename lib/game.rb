require_relative './frame'
require 'stringio'

class Game
  def play_frame(frame = Frame.new)
    first_roll = frame.roll
    { first_roll: first_roll }
  end
end
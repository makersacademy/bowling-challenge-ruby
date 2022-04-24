require_relative './frame'
require 'stringio'

class Game
  def play_frame
    frame = Frame.new
    knocked_down = $stdin.gets.chomp
    first_roll = frame.roll(knocked_down)
    { first_roll: first_roll[:score] }
  end
end
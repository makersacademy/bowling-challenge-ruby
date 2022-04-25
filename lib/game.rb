require_relative './frame'
require 'stringio'

class Game

  def self.play(frame_class = Frame)
    game = Game.new
    10.times { game.scoresheet << game.play_frame(frame_class.new) }
    game.scoresheet
  end

  attr_reader :scoresheet

  def initialize
    @scoresheet = []
  end

  def play_frame(frame = Frame.new)
    first_roll = frame.roll
    frame.update_score(:first_roll, first_roll)
    unless frame.strike?
      second_roll = frame.roll
      frame.update_score(:second_roll, second_roll)
    end
    p frame.frame_score
  end



end

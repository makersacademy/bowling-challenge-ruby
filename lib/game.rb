require_relative 'frame'

class Game
  attr_reader :frames
  MAX_FRAMES = 10

  def initialize
    @max_frames = MAX_FRAMES
    @frames = []
  end

  # lets create a frame and roll for it

  def create_game
    until @frames.length == @max_frames
      frame = Frame.new       
      until frame.completed?
        puts 'Number of pins knocked down'
        pins = gets.chomp.to_i
        frame.roll(pins)
      end
      @frames << frame
    end
  end

end
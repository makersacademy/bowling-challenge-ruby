require_relative './frame.rb'

class Game

  FRAMES_PER_GAME = 10

  def initialize
    @frames = (1..FRAMES_PER_GAME).to_a.collect{ |frame| frame = Frame.new }
  end

  def frames_array
    @frames
  end

  def get_roll
    STDIN.gets.chomp.to_i
  end

end

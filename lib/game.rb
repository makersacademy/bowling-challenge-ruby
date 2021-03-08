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
    10.times{ @frames << Frame.new }
  end

  # lets input the rolls for all frames
  def input_rolls
    i = 0
    while i < @max_frames do
      # while !@frames[i].completed? do
        puts "Input number of pins knocked down for frames#{i}"
        pins = gets.chomp.to_i
        p @frames[i]
        @frames[i].roll(pins)
      # end
      i += 1
    end
  end

end
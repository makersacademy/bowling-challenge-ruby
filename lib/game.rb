require './lib/frame.rb'

class Game
  def initialize 
    @frames = []
  end 

  def add_frame(frame)
    @frames << frame
  end 

  attr_reader :frames
end 


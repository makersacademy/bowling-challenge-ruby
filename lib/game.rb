require './lib/frame.rb'

class Game
  def initialize 
    @frames = []
  end 

  def add_frame(frame)
    @frames << frame
  end 

  def total_score
    @frames.flatten.sum
  end

  attr_reader :frames
end 


require_relative 'frame.rb'

class Game 
  attr_reader :frames
  def initialize
    @frames = []
  end 
  
  def new_frame
    @frames << Frame.new(frames.length + 1)
  end 
end 
class Game
  def initialize 
    frames = []
  end 

  def add_frame 
    frames << Frame.new
  end 

  attr_reader :frames
end 


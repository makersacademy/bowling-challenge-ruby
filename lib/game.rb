require 'frame'

class Game 

  attr_reader :frames

  def initialize
    @frames = []
  end

  def turn(frame)
    @frames << frame.frame
  end

end
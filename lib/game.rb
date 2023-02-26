require_relative './frame'

class Game
  attr_reader :frames

  def initialize
    @frames = [] 
    10.times do
      @frames.push(Frame.new)
    end
    @framecount = 0
  end  

end  

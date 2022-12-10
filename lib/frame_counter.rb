class FrameCounter
  def initialize(game)
    @game = game
  end

  def total_number
    return @game.length
  end
  
  def max_number_of_frame?
    total_number >= 10 ? true : false
  end   
end

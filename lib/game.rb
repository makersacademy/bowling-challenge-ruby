class Game
  MAX_ROLLS = 20
  
  def initialize
    @frame = Frame.new
  end

  attr_reader :frame
end
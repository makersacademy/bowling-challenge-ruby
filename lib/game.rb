require 'frame'

class Game
  attr_reader :score

  def initialize(frame = Frame)
    @score = 0
    @frames = []
  end

end
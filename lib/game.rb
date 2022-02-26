require 'frame'

class Game

  attr_accessor :game_score

  def initialize
    @game_score = 0
    @frame = Frame.new
  end
  
  def input(points)
    @game_score += points
  end

end